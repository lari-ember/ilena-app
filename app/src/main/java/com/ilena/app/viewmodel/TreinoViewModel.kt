package com.ilena.app.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.ilena.app.data.RetrofitClient
import com.ilena.app.model.TreinoRequest
import com.ilena.app.model.TreinoResponse
import kotlinx.coroutines.launch

class TreinoViewModel : ViewModel() {

    private val _treinoResult = MutableLiveData<Result<TreinoResponse>>()
    val treinoResult: LiveData<Result<TreinoResponse>> = _treinoResult

    fun registrarTreino(nome: String, tipo: String, duracaoMinutos: Int) {
        viewModelScope.launch {
            runCatching {
                RetrofitClient.treinoApiService.criarTreino(
                    TreinoRequest(
                        nome = nome,
                        tipo = tipo,
                        duracaoMinutos = duracaoMinutos,
                    )
                )
            }.also { _treinoResult.value = it }
        }
    }
}
