package com.ilena.app.ui

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.ilena.app.databinding.ActivityMainBinding
import com.ilena.app.viewmodel.TreinoViewModel

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private val viewModel: TreinoViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        observeViewModel()

        binding.btnRegistrarTreino.setOnClickListener {
            val nome = binding.etNomeTreino.text.toString().trim()
            val tipo = binding.etTipoTreino.text.toString().trim()
            val duracaoText = binding.etDuracaoTreino.text.toString().trim()

            if (nome.isEmpty() || tipo.isEmpty() || duracaoText.isEmpty()) {
                Toast.makeText(this, getString(R.string.preencha_todos_campos), Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            val duracao = duracaoText.toIntOrNull()
            if (duracao == null || duracao <= 0) {
                Toast.makeText(this, getString(R.string.duracao_invalida), Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            binding.progressBar.visibility = View.VISIBLE
            binding.btnRegistrarTreino.isEnabled = false
            viewModel.registrarTreino(nome, tipo, duracao)
        }
    }

    private fun observeViewModel() {
        viewModel.treinoResult.observe(this) { result ->
            binding.progressBar.visibility = View.GONE
            binding.btnRegistrarTreino.isEnabled = true

            result.onSuccess { treino ->
                binding.tvResposta.text = treino.mensagem
            }.onFailure { error ->
                binding.tvResposta.text = getString(R.string.erro_ao_registrar, error.localizedMessage)
            }
        }
    }
}
