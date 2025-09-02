#!/usr/bin/env bash
set -euo pipefail

LLM_MODEL_NAME="${1:-TinyLlama}"
echo "Using LLM Model: $LLM_MODEL_NAME"

for seed in 0
do
# 1) inference only
# a) Question-Only
python inference.py --model_name llm --llm_model_name $LLM_MODEL_NAME --max_txt_len 0 --seed $seed
# b) Textual Graph + Question
python inference.py --model_name llm --llm_model_name $LLM_MODEL_NAME --seed $seed

# 2) frozen llm + prompt tuning
# a) prompt tuning
python train.py --model_name pt_llm --seed $seed --llm_model_name $LLM_MODEL_NAME
# b) g-retriever
python train.py --model_name graph_llm --seed $seed --llm_model_name $LLM_MODEL_NAME

# 3) tuned llm
# a) finetuning with lora
python train.py --model_name llm --llm_frozen False --seed $seed --llm_model_name $LLM_MODEL_NAME
# b) g-retriever + finetuning with lora
python train.py --model_name graph_llm --llm_frozen False --seed $seed --llm_model_name $LLM_MODEL_NAME

done
