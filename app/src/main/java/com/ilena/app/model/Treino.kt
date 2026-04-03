package com.ilena.app.model

import com.google.gson.annotations.SerializedName

data class TreinoRequest(
    val nome: String,
    val tipo: String,
    @SerializedName("duracao_minutos") val duracaoMinutos: Int,
    val observacoes: String? = null,
)

data class TreinoResponse(
    val id: Int,
    val nome: String,
    val tipo: String,
    @SerializedName("duracao_minutos") val duracaoMinutos: Int,
    val observacoes: String?,
    val mensagem: String,
)
