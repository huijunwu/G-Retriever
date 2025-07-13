from src.model.graph_llm import GraphLLM
from src.model.llm import LLM
from src.model.pt_llm import PromptTuningLLM

load_model = {
    "llm": LLM,
    "inference_llm": LLM,
    "pt_llm": PromptTuningLLM,
    "graph_llm": GraphLLM,
}

# Replace the following with the model paths
llama_model_path = {
    "7b": "meta-llama/Llama-2-7b-hf",
    "7b_chat": "meta-llama/Llama-2-7b-chat-hf",
    "13b": "meta-llama/Llama-2-13b-hf",
    "13b_chat": "meta-llama/Llama-2-13b-chat-hf",
    # "7b_gptq": "TheBloke/Llama-2-7B-GPTQ",
    "tinyllama": "TinyLlama/TinyLlama-1.1B-Chat-v1.0",
}
