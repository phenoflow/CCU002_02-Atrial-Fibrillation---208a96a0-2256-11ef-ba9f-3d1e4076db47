$namespaces:
  s: http://phenomics.kcl.ac.uk/phenoflow/
baseCommand: node
class: CommandLineTool
cwlVersion: v1.0
doc: Read potential cases from a FHIR server.
inputs:
- doc: Node implementation unit
  id: inputModule
  inputBinding:
    position: 1
  type: File
outputs:
- doc: Initial potential cases, read from a FHIR server.
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerPull: kclhi/node:latest
s:type: external
