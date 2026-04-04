package com.ilena.app.data

import com.ilena.app.model.ChatRequest
import com.ilena.app.model.ChatResponse
import retrofit2.http.Body
import retrofit2.http.POST

interface ChatApiService {

    @POST("chat/")
    suspend fun sendMessage(@Body request: ChatRequest): ChatResponse
}

