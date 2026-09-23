# Laboratorio 04 - Terraform

Este proyecto fue realizado con **Terraform y Docker** para desplegar dos ambientes: **DEV** y **QA**.

Cada ambiente cuenta con:

- Frontend con Nginx
- Backend con Node.js
- Base de datos PostgreSQL

Para manejar ambos ambientes con la misma configuración se utilizaron **Terraform Workspaces**.

## Integrantes

Este proyecto fue realizado por el **Grupo 7**:

- Leon Poveda Joel
- Quinde Rojas Jesus
- Rios Iparraguirre Jhontan
- Villena Flores Cristhian
- Gordillo Saona Diego

## Estructura del proyecto

```text
lab04_iac/
├── iac/
│   ├── providers.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── web-server.tf
│   └── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Configuración

La comunicación entre los servicios sigue esta estructura:

```text
Frontend → Backend → PostgreSQL
```

### Ambiente DEV

```text
web-dev       4001:80
api-dev       4002:3000
database-dev  4003:5432
```

### Ambiente QA

```text
web-qa        5001:80
api-qa        5002:3000
database-qa   5003:5432
```

Los ambientes se manejan mediante Terraform Workspaces, permitiendo utilizar la misma configuración y cambiar únicamente los nombres y puertos correspondientes.

## Requisitos

Antes de ejecutar el proyecto se debe tener instalado:

- Git
- Terraform
- Docker Desktop

Docker Desktop debe estar iniciado antes de ejecutar Terraform.

## Descargar el proyecto

Clonar el repositorio:

```bash
git clone https://github.com/jhonatan-ri/lab04-iac.git
```

Ingresar al proyecto:

```bash
cd lab04-iac
```

Luego ingresar a la carpeta de Terraform:

```bash
cd iac
```

## Inicializar Terraform

Ejecutar:

```bash
terraform init
```

Luego validar la configuración:

```bash
terraform validate
```

## Ambiente DEV

Crear el workspace:

```bash
terraform workspace new dev
```

Si ya existe:

```bash
terraform workspace select dev
```

Revisar la configuración:

```bash
terraform plan
```

Crear los recursos:

```bash
terraform apply
```

Cuando Terraform solicite confirmación, escribir:

```text
yes
```

## Ambiente QA

Crear el workspace:

```bash
terraform workspace new qa
```

Si ya existe:

```bash
terraform workspace select qa
```

Luego ejecutar:

```bash
terraform plan
terraform apply
```

Y confirmar escribiendo:

```text
yes
```

## Verificación

Para comprobar que los contenedores están ejecutándose:

```bash
docker ps
```

Para revisar los workspaces disponibles:

```bash
terraform workspace list
```

Al desplegar ambos ambientes deben aparecer los siguientes contenedores:

```text
web-dev
api-dev
database-dev

web-qa
api-qa
database-qa
```

## Eliminar infraestructura

Primero seleccionar el ambiente:

```bash
terraform workspace select dev
```

o:

```bash
terraform workspace select qa
```

Luego ejecutar:

```bash
terraform destroy
```

Y confirmar con:

```text
yes
```

## Conventional Commits

Para los cambios del proyecto se utilizó la estructura de **Conventional Commits**.

Ejemplo:

```bash
git add .
git commit -m "feat: configure terraform infrastructure"
git push
```

Otros tipos de commits que se pueden utilizar son:

```text
feat: nueva funcionalidad
fix: corrección
docs: documentación
chore: configuración o mantenimiento
```

## Nota

Debido al tiempo disponible, el repositorio de GitHub no fue creado desde el inicio del desarrollo del proyecto. Gran parte de la configuración ya se encontraba avanzada cuando se inicializó Git, por lo que no se realizaron muchos commits durante las primeras etapas.

A partir de la creación del repositorio se comenzó a utilizar **Conventional Commits** para registrar los cambios realizados.