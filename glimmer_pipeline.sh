
#!/usr/bin/env bash

# Train Glimmer using the H. praevalens genome
# and predict coding sequences in halan.fasta.

scp /Users/rishithapulakhandam/Downloads/halan.fasta \
    rpulakh1@bfx3.aap.jhu.edu:/home/rpulakh1/TFGA/Exam1

scp /Users/rishithapulakhandam/Downloads/hprev_genome.fasta \
    rpulakh1@bfx3.aap.jhu.edu:/home/rpulakh1/TFGA/Exam1

/opt/glimmer3.02/bin/long-orfs \
    -n -t 1.15 hprev_genome.fasta genome.longorfs

/opt/glimmer3.02/bin/extract \
    -t hprev_genome.fasta genome.longorfs > genome.train

/opt/glimmer3.02/bin/build-icm \
    -r genome.icm < genome.train

/opt/glimmer3.02/bin/glimmer3 \
    -o50 -g110 -t30 halan.fasta genome.icm halan

/opt/glimmer3.02/bin/extract \
    -t halan.fasta halan.predict > halan.glimmer
