
python -m src.dataset.preprocess.expla_graphs

python -m src.dataset.expla_graphs


export WANDB_API_KEY='ba4c316cc84d63b9767ee7413ea834fa7d06f3bf'

######## 1) Inference-Only LLM
python inference.py --model_name inference_llm


######## 2) Frozen LLM + Prompt Tuning
# prompt tuning
python train.py --model_name pt_llm

# G-Retriever
python train.py --model_name graph_llm


######## 3) Tuned LLM
# finetune LLM with LoRA
python train.py --model_name llm --llm_frozen False

python train.py --model_name pt_llm --llm_frozen False

# G-Retriever with LoRA
python train.py --model_name graph_llm --llm_frozen False

