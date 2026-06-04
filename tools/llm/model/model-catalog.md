# List of LLM model used, tested, considered

## Usage

For Llama.cpp you need GGUF files, and you can download them with a browser from [Huggingface](https://huggingface.co).

For Ollama, it can download them from it's registry.

## Tested

### Small

- [Ministral-3-3B-Instruct-2512-Q4_K_M](https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512-GGUF)  
  - below minute
  - Test done on a PC with 12th Gen Intel(R) Core(TM) i7-1260, 12 cores, 2.1GHz, 32GB RAM, no GPU

### Medium

- [Ministral-3-8B-Instruct-2512-Q5_K_M](https://huggingface.co/mistralai/Ministral-3-8B-Instruct-2512-GGUF)
  - below minute
  - Test done on a PC with 12th Gen Intel(R) Core(TM) i7-1260, 12 cores, 2.1GHz, 32GB RAM, no GPU

### Large

- [Ministral-3-14B-Instruct-2512-Q4_K_M](https://huggingface.co/mistralai/Ministral-3-14B-Instruct-2512-GGUF)
  - few minutes
  - Test done on a PC with 12th Gen Intel(R) Core(TM) i7-1260, 12 cores, 2.1GHz, 32GB RAM, no GPU

### Huge

- [Mistral-Small-3.2-24B-Instruct-2506-GGUF Q4_K_M](https://huggingface.co/unsloth/Mistral-Small-3.2-24B-Instruct-2506-GGUF) (Q4)
  - few minutes
  - Test done on a PC with 12th Gen Intel(R) Core(TM) i7-1260, 12 cores, 2.1GHz, 32GB RAM, no GPU

### Huger

- [Mistral-Small-3.2-24B-Instruct-2506-UD-Q6_K_XL](https://huggingface.co/unsloth/Mistral-Small-3.2-24B-Instruct-2506-GGUF)
  - some minutes, sometime 5 minutes
  - 32Go RAM is seldom enough, but it works
