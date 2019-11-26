set -e
set -x
export PYTHONPATH='./src'

# Experient index!!
file_name=`basename $0`
experiment_index=${file_name##*_}
experiment_index=${experiment_index%%.*}


CUDA_VISIBLE_DEVICES=0,1,2,3 python -u src/trainer.py \
    --experiment_index=$experiment_index \
    --cudas=0,1,2,3 \
    --n_epochs=800 \
    --batch_size=20 \
    --server=lab_center \
    --eval_frequency=10 \
    --backbone=PNASNet5Large \
    --learning_rate=1e-4 \
    --optimizer=Adam \
    --initialization=pretrained \
    --num_classes=7 \
    --num_worker=4 \
    --input_channel=3 \
    --iter_fold=1 \
    --seed=47 \
    2>&1 | tee $log_file
