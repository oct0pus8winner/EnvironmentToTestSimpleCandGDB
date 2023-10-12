# EnvironmentToTestSimpleCandGDB
dockerfile and docker-sompose.yml to generate simple container to test c environment

# Environment 

My environment

- CPU : Intel(R) Core(TM) i7-9850H CPU @ 2.60GHz   2.59 GHz
- RAM : 32.0 GB (31.7 GB 使用可能)
- GPU : NVIDIA Quadro T100
- windows : windows11 Pro 22H2
- wsl2 :
  - Description:    Ubuntu 22.04.3 LTS
  - Release:        22.04
  - Codename:       jammy


# Need to install

- wsl2
- docker desktop

(optional)
- vscode

# How to start it

run next commands

```
$docker compoes up -d
$docker exec -it TestEnvForC /bin/bash
```

it will be done.
