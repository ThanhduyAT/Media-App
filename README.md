# Media-App

Clean Architecture

Folder Tree

```
📦 Media-App
 ├── 📂 Application
 │    ├── 📄 MediaApp_Clean_ArchitectureApp.swift.swift
 │
 ├── 📂 Domain
 │    ├── 📂 Feature
 │    │    ├── 📂 Feature A
 │    │    │    ├── 📂 Entities
 │    │    │    ├── 📂 Interfaces
 │    │    │    ├── 📂 UseCases
 │    │    ├── 📂 Feature B
 │
 ├── 📂 DataRepositories
 │
 ├── 📂 Presentation
 │
 ├── 📂 DIContainer         👈 Only use for Presentation. Import Domain, DataRepositories
 │
 ├── 📂 Common
 │
 ├── 📂 Networking
```
