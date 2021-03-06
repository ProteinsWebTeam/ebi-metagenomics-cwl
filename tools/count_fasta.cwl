#!/usr/bin/env
cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

inputs:
  sequences:
    type: File
    streamable: true
    format: edam:format_1929  # FASTA 

stdin: $(inputs.sequences.path)

baseCommand: [ grep, -c, '^>' ]

stdout: count

outputs:
  count:
    type: int
    outputBinding:
      glob: count
      loadContents: true
      outputEval: $(Number(self[0].contents))

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"
