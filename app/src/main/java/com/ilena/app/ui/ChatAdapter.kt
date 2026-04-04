package com.ilena.app.ui

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ilena.app.databinding.ItemMessageBinding
import com.ilena.app.model.Message
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class ChatAdapter(private var messages: List<Message> = emptyList()) :
    RecyclerView.Adapter<ChatAdapter.MessageViewHolder>() {

    fun updateMessages(newMessages: List<Message>) {
        messages = newMessages
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MessageViewHolder {
        val binding = ItemMessageBinding.inflate(
            LayoutInflater.from(parent.context),
            parent,
            false
        )
        return MessageViewHolder(binding)
    }

    override fun onBindViewHolder(holder: MessageViewHolder, position: Int) {
        holder.bind(messages[position])
    }

    override fun getItemCount(): Int = messages.size

    class MessageViewHolder(private val binding: ItemMessageBinding) :
        RecyclerView.ViewHolder(binding.root) {

        fun bind(message: Message) {
            if (message.isFromUser) {
                binding.flUserMessage.visibility = android.view.View.VISIBLE
                binding.flAssistantMessage.visibility = android.view.View.GONE

                binding.tvUserMessage.text = message.text
                binding.tvUserTimestamp.text = formatTimestamp(message.timestamp)
            } else {
                binding.flUserMessage.visibility = android.view.View.GONE
                binding.flAssistantMessage.visibility = android.view.View.VISIBLE

                binding.tvAssistantMessage.text = message.text
                binding.tvAssistantTimestamp.text = formatTimestamp(message.timestamp)
            }
        }

        private fun formatTimestamp(timestamp: Long): String {
            val sdf = SimpleDateFormat("HH:mm", Locale.getDefault())
            return sdf.format(Date(timestamp))
        }
    }
}

