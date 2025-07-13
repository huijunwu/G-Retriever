#!/usr/bin/env bash
set -euo pipefail

for seed in 0
do
# 1) inference only
# a) Question-Only
# python inference.py --model_name llm --llm_model_name 7b_chat --max_txt_len 0 --seed $seed
# b) Textual Graph + Question
# python inference.py --model_name llm --llm_model_name 7b_chat --seed $seed

# 2) frozen llm + prompt tuning
# a) prompt tuning
# python train.py --model_name pt_llm --seed $seed
# b) g-retriever
python train.py --model_name graph_llm --seed $seed

# 3) tuned llm
# a) finetuning with lora
# python train.py --model_name llm --llm_frozen False --seed $seed
# b) g-retriever + finetuning with lora
python train.py --model_name graph_llm --llm_frozen False --seed $seed

done
