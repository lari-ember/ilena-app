package com.ilena.app.ui

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.ilena.app.R
import com.ilena.app.databinding.ActivityChatBinding
import com.ilena.app.viewmodel.ChatViewModel
import com.ilena.app.viewmodel.ChatUiState

class ChatActivity : AppCompatActivity() {

    private lateinit var binding: ActivityChatBinding
    private val viewModel: ChatViewModel by viewModels()
    private lateinit var chatAdapter: ChatAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityChatBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupRecyclerView()
        setupListeners()
        observeViewModel()
    }

    private fun setupRecyclerView() {
        chatAdapter = ChatAdapter()
        binding.rvMessages.apply {
            layoutManager = LinearLayoutManager(this@ChatActivity).apply {
                stackFromEnd = true // Iniciar do final da lista
            }
            adapter = chatAdapter
        }
    }

    private fun setupListeners() {
        binding.btnSend.setOnClickListener {
            val messageText = binding.etMessage.text.toString().trim()
            if (messageText.isNotEmpty()) {
                viewModel.sendMessage(messageText)
                binding.etMessage.text.clear()
                // Scroll para a última mensagem
                binding.rvMessages.smoothScrollToPosition(chatAdapter.itemCount - 1)
            } else {
                Toast.makeText(
                    this,
                    "Digite uma mensagem",
                    Toast.LENGTH_SHORT
                ).show()
            }
        }

        binding.btnClearChat.setOnClickListener {
            viewModel.clearMessages()
            binding.etMessage.text.clear()
            Toast.makeText(this, "Chat limpo", Toast.LENGTH_SHORT).show()
        }
    }

    private fun observeViewModel() {
        viewModel.messages.observe(this) { messages ->
            chatAdapter.updateMessages(messages)
            // Scroll para a última mensagem quando novas mensagens chegam
            if (messages.isNotEmpty()) {
                binding.rvMessages.smoothScrollToPosition(messages.size - 1)
            }
        }

        viewModel.uiState.observe(this) { state ->
            when (state) {
                is ChatUiState.Idle -> {
                    binding.llLoading.visibility = View.GONE
                    binding.tvError.visibility = View.GONE
                }
                is ChatUiState.Loading -> {
                    binding.llLoading.visibility = View.VISIBLE
                    binding.tvError.visibility = View.GONE
                    binding.btnSend.isEnabled = false
                }
                is ChatUiState.Success -> {
                    binding.llLoading.visibility = View.GONE
                    binding.tvError.visibility = View.GONE
                    binding.btnSend.isEnabled = true
                }
                is ChatUiState.Error -> {
                    binding.llLoading.visibility = View.GONE
                    binding.tvError.visibility = View.VISIBLE
                    binding.tvError.text = getString(R.string.error_message, state.error)
                    binding.btnSend.isEnabled = true
                }
            }
        }
    }
}


