# RegulonDB_healthcheck

## Content of the repository

```
├── Binding_dataset_report.Rdata
├── README.md
├── TFBS_differences_107_1102.tsv
├── TFBS_full_join_107_1102.tsv
├── TFBS_report.Rmd
├── TFBS_report.html
├── _Databases
│   └── RegulonDB
│       └── releases
│           ├── 10.10
│           ├── 10.6
│           ├── 10.6.3
│           ├── 10.7
│           ├── 10.8
│           ├── 10.9
│           ├── 11.0
│           ├── 11.0.1
│           └── 11.0.2
└── utils.r
```

## Description:


**TFBS_report.Rmd:** main file that processes the data and generates graphs and the final report

**TFBS_report.html:** HTML graohical report (generated automatically by the Rmd file)

**Binding_dataset_report.Rdata:** backup of the R data (generated automatically by the Rmd file)

**utils.r:** some personal custom functions

**_Databases:** source data downloaded from RegulonDB and processed by the Rmd file

**TFBS_full_join_107_1102.tsv:** mapping of the TFBSs from versions 10.7 and 11.0.1 (generated automatically by the RmD)

**TFBS_differences_107_1102.tsv:** differences between the TFBSs from versions 10.7 and 11.0.1 (generated automatically by the RmD)           
