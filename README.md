# Comparative Bacterial Genome Annotation Using Glimmer and FGENESB

## Overview

This project predicts coding sequences (CDSs) in a partial *Halanaerobium* genome contig using Glimmer 3.02 and compares the predictions with FGENESB.

The complete genome of the related species *Halanaerobium praevalens* is used to train Glimmer. The trained model is then applied to the target contig to identify putative open reading frames (ORFs) and coding regions.

## Objectives

- Train Glimmer using a related bacterial genome.
- Predict ORFs and coding sequences in a partial genome contig.
- Extract predicted coding sequences in FASTA format.
- Compare Glimmer and FGENESB gene predictions.
- Identify differences in predicted coding-region boundaries.

## Tools and Technologies

- **Glimmer 3.02** — bacterial gene prediction
- **FGENESB** — independent bacterial gene prediction
- **Linux / Bash** — command-line execution
- **FASTA** — nucleotide sequence input and output

## Input Data

| File | Description |
|---|---|
| `halan.fasta` | Partial contig from a *Halanaerobium* strain |
| `hprev_genome.fasta` | Complete *Halanaerobium praevalens* genome used for training |

The original analysis was performed on the BFX server. The input files should be obtained from their original sources or added to the repository if redistribution is permitted.

## Methodology

### 1. Train the Glimmer model

The `long-orfs` program identifies long open reading frames in the training genome. The `extract` and `build-icm` programs prepare the training sequences and build the interpolated context model.

### 2. Predict coding regions

Glimmer uses the trained model to predict coding regions in `halan.fasta`. The `extract` program then extracts the predicted sequences.

### 3. Compare predictions

The Glimmer predictions are compared with the FGENESB results to assess agreement in gene coordinates, strand orientation, and predicted coding-region boundaries.

## Results

The original coursework documented four predicted coding regions:

| ORF | Start | End | Reported length |
|---|---:|---:|---:|
| orf00001 | 171 | 350 | 177 bp |
| orf00003 | 343 | 1626 | 1,281 bp |
| orf00004 | 1629 | 4733 | 2,894 bp |
| orf00005 | 5786 | 4971 | 813 bp |

The fifth ORF's descending coordinates indicate a reverse-strand prediction.

### Comparison with FGENESB

The original analysis reported that the principal difference was the start boundary of the first predicted coding region:

- **Glimmer:** position 171
- **FGENESB:** position 3

The remaining three reported coding regions were described as matching between the two tools.

These findings are based on the original coursework report. The raw prediction files should be checked before treating the results as independently validated.

## Repository Structure

```text
bacterial-genome-annotation/
├── README.md
├── scripts/
│   └── glimmer_pipeline.sh
├── data/
│   ├── halan.fasta
│   └── hprev_genome.fasta
└── results/
    ├── halan.predict
    ├── halan.glimmer
    └── glimmer_fgenesb_comparison.tsv
```

## Running the Pipeline

1. Install or obtain access to Glimmer 3.02.
2. Place both input FASTA files in the working directory.
3. Update the Glimmer executable path in `scripts/glimmer_pipeline.sh`.
4. Run the script from the directory containing the input files.
5. Review the generated prediction files.

FGENESB is a separate tool and is not executed by the Glimmer script. Its output must be obtained independently to reproduce the comparison.

## Limitations

- The target sequence is a partial contig, not a complete genome.
- Predictions depend on the training genome and selected parameters.
- Predicted coding regions are computational annotations and require independent validation.
- The original analysis used a remote server environment; the workflow may require path and environment changes on other systems.

## Project Status

Coursework-based bioinformatics project. The methods and findings are documented from the original analysis.
