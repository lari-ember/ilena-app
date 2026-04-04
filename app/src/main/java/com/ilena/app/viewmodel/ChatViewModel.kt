package com.ilena.app.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.ilena.app.data.RetrofitClient
import com.ilena.app.model.ChatRequest
import com.ilena.app.model.Message
import kotlinx.coroutines.launch

class ChatViewModel : ViewModel() {

    private val _messages = MutableLiveData<List<Message>>(emptyList())
    val messages: LiveData<List<Message>> = _messages

    private val _uiState = MutableLiveData<ChatUiState>(ChatUiState.Idle)
    val uiState: LiveData<ChatUiState> = _uiState

    fun sendMessage(text: String) {
        if (text.trim().isEmpty()) {
            _uiState.value = ChatUiState.Error("Mensagem não pode estar vazia")
            return
        }

        // Adicionar mensagem do usuário imediatamente
        val userMessage = Message(
            text = text,
            isFromUser = true
        )
        val currentMessages = _messages.value.orEmpty()
        _messages.value = currentMessages + userMessage

        // Limpar estado anterior
        _uiState.value = ChatUiState.Loading

        // Enviar para o backend
        viewModelScope.launch {
            runCatching {
                RetrofitClient.chatApiService.sendMessage(ChatRequest(text))
            }.onSuccess { response ->
                val assistantMessage = Message(
                    text = response.message,
                    isFromUser = false
                )
                val updatedMessages = (_messages.value.orEmpty()) + assistantMessage
                _messages.value = updatedMessages
                _uiState.value = ChatUiState.Success(response.message)
            }.onFailure { error ->
                _uiState.value = ChatUiState.Error(
                    error.localizedMessage ?: "Erro desconhecido"
                )
            }
        }
    }

    fun clearMessages() {
        _messages.value = emptyList()
        _uiState.value = ChatUiState.Idle
    }
}

sealed class ChatUiState {
    object Idle : ChatUiState()
    object Loading : ChatUiState()
    data class Success(val message: String) : ChatUiState()
    data class Error(val error: String) : ChatUiState()
}

