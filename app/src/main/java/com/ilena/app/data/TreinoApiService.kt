package com.ilena.app.data

import com.ilena.app.model.TreinoRequest
import com.ilena.app.model.TreinoResponse
import retrofit2.http.Body
import retrofit2.http.POST

interface TreinoApiService {

    @POST("treino/")
    suspend fun criarTreino(@Body request: TreinoRequest): TreinoResponse
}
