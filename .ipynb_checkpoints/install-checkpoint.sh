#!/bin/bash

# install Anaconda
# cd into ANARCI
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u
source ~/miniconda3/bin/activate
conda init bash

rm Miniconda3-latest-Linux-x86_64.sh

# echo "export PATH=$HOME/miniconda3/bin:$PATH" >> ~/.bashrc
# source ~/.bashrc

# Create ANARCI Virtual Environment
conda create --name anarci python=3.11 -y
conda activate anarci
conda install ipykernel -y
python -m ipykernel install --user --name=anarci --display-name="anarci"

# conda activate anarci
#while anarci is activated install anarci
conda install -c conda-forge openmm pdbfixer -y
conda install -c bioconda hmmer=3.3.2 biopython -y
python setup.py install

# # #install packages for progen modeling
pip install torch tokenizers transformers pandas datasets

# #run test
ANARCI -i EVQLQQSGAEVVRSGASVKLSCTASGFNIKDYYIHWVKQRPEKGLEWIGWIDPEIGDTEYVPKFQGKATMTADTSSNTAYLQLSSLTSEDTAVYYCNAGHDYDRGRFPYWGQGTLVTVSA