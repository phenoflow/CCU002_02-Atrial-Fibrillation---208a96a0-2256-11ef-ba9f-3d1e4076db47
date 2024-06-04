cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_02-atrial-fibrillation-af---primary:
    run: ccu002_02-atrial-fibrillation-af---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  rapid-ccu002_02-atrial-fibrillation-af---primary:
    run: rapid-ccu002_02-atrial-fibrillation-af---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af---primary/output
  ccu002_02-atrial-fibrillation-af-letter---primary:
    run: ccu002_02-atrial-fibrillation-af-letter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: rapid-ccu002_02-atrial-fibrillation-af---primary/output
  ccu002_02-atrial-fibrillation-af-flutter---primary:
    run: ccu002_02-atrial-fibrillation-af-flutter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af-letter---primary/output
  ccu002_02-atrial-fibrillation-af-invitation---primary:
    run: ccu002_02-atrial-fibrillation-af-invitation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af-flutter---primary/output
  paroxysmal-ccu002_02-atrial-fibrillation-af---primary:
    run: paroxysmal-ccu002_02-atrial-fibrillation-af---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af-invitation---primary/output
  chronic-ccu002_02-atrial-fibrillation-af---primary:
    run: chronic-ccu002_02-atrial-fibrillation-af---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: paroxysmal-ccu002_02-atrial-fibrillation-af---primary/output
  fibrillation---primary:
    run: fibrillation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: chronic-ccu002_02-atrial-fibrillation-af---primary/output
  ccu002_02-atrial-fibrillation-af-quality---primary:
    run: ccu002_02-atrial-fibrillation-af-quality---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: fibrillation---primary/output
  ccu002_02-atrial-fibrillation-af-monitoring---primary:
    run: ccu002_02-atrial-fibrillation-af-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af-quality---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_02-atrial-fibrillation-af-monitoring---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
