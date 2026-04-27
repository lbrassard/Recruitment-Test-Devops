# Question 4 — CI/CD / GitHub Actions or Azure Pipelines

Following Question 3, build and publish the SQL Server image to a container registry.

**Target image (GHCR example)**
```
ghcr.io/REPOSITORY_NAME/mssql:2019-latest
```

**Task**
- Complete `cd.yml` to:
  - Build the Docker image.
  - Push it to GHCR.
- You may answer using **GitHub Actions** or **Azure Pipelines** (your choice).

**Deliverables**
- Updated `cd.yml` (or an Azure Pipelines YAML file if you choose that route).
- A short note on how you would secure secrets in a real pipeline.

If using a azure pipeline, I would have the ACR credentials stored in a service connections that is read only. When used the credentials would appears in the pipeline as '******' and cannot be read by anyone. 

If using github actions like in this examples, I would create a PAT with the scopes given in the documentation and let the pipeline fetch it and connect to the ghcr without having to write my secret in the code
