# rodo-dbeaver-workspace

Workspace de DBeaver sincronizado entre las dos máquinas de desarrollo del usuario (MacBook M y Mac Pro 2013). Mismo patrón que `rodo-claude-memory`: repo privado + symlinks desde `~/Library/DBeaverData/`.

Repo privado: `git@github.com:rodo-globe/rodo-dbeaver-workspace.git`

## Qué hay acá

```
dbeaver-workspace/
├── workspace6/
│   ├── General_macpro/           Proyecto principal — 60+ conexiones, 55 scripts, diagrams
│   │   ├── .dbeaver/             data-sources.json (conexiones), project-metadata.json
│   │   ├── .settings/
│   │   ├── Scripts/              SQL scripts organizados en subcarpetas
│   │   ├── Diagrams/             ER diagrams
│   │   └── .project              metadata Eclipse
│   └── Local/                    Proyecto secundario
└── secure/                       Storage seguro de DBeaver (placeholder vacío hoy)
```

`workspace6/.metadata/` queda **local en cada máquina** — no se sincroniza. Es la config UI de Eclipse/DBeaver (layouts, recent files, history, locks). Cambia constantemente y no aporta nada a la otra máquina.

## Cómo funciona

`~/Library/DBeaverData/` de cada máquina tiene symlinks apuntando a este repo:

```
~/Library/DBeaverData/
├── workspace6/
│   ├── General_macpro/  → symlink al repo
│   ├── Local/           → symlink al repo
│   └── .metadata/       LOCAL — config UI, no se sincroniza
├── secure/              → symlink al repo
├── drivers/             LOCAL — JARs descargados de proveedores; pesado, se regenera
└── .workspaces          LOCAL — marker de DBeaver
```

Cuando agregás una conexión o un script, DBeaver lo escribe en el path symlinked → cae físicamente en el repo. Hacés commit + push cuando querés y la otra máquina hace pull.

## Credenciales

**Las credenciales NO viajan por GitHub.** El archivo `credentials-config.json` (passwords encriptados de las conexiones) está en `.gitignore`. Cuando montés el workspace en una máquina nueva, hay que **copiar manualmente** ese archivo desde una máquina donde ya está, vía SSHFS o transferencia directa.

Razón: aunque están encriptados con master password de DBeaver y el repo es privado, son credenciales productivas (DBs de clientes) y no corresponde mandarlas a GitHub.

Patrón de copia (desde MacBook M con SSHFS al Mac Pro):

```bash
cp ~/Library/DBeaverData/workspace6/General_macpro/.dbeaver/credentials-config.json \
   ~/macpro/Library/DBeaverData/workspace6/General_macpro/.dbeaver/credentials-config.json

cp ~/Library/DBeaverData/workspace6/Local/.dbeaver/credentials-config.json \
   ~/macpro/Library/DBeaverData/workspace6/Local/.dbeaver/credentials-config.json
```

Si configuraste una master password en DBeaver, en la otra máquina te la va a pedir la primera vez. Si no la configuraste, DBeaver deriva la key del entorno (usuario, etc.) y como el usuario es `rodo` en ambas suele descifrar sin pedir nada.

## Setup inicial en una máquina

### Máquina con SSHFS activo (caso típico para Rodo)

Si la máquina nueva es la otra con la que ya tenés SSHFS:

```bash
# Desde MacBook M, con el mount activo:
mkdir -p ~/macpro/develop/source_code/globe
cd ~/macpro/develop/source_code/globe
git clone git@github.com:rodo-globe/rodo-dbeaver-workspace.git dbeaver-workspace

# Crear symlinks en ~/macpro/Library/DBeaverData/ — esto Claude lo hace
mkdir -p ~/macpro/Library/DBeaverData/workspace6
ln -s /Users/rodo/develop/source_code/globe/dbeaver-workspace/workspace6/General_macpro \
      ~/macpro/Library/DBeaverData/workspace6/General_macpro
ln -s /Users/rodo/develop/source_code/globe/dbeaver-workspace/workspace6/Local \
      ~/macpro/Library/DBeaverData/workspace6/Local
ln -s /Users/rodo/develop/source_code/globe/dbeaver-workspace/secure \
      ~/macpro/Library/DBeaverData/secure

# Copiar credentials manualmente
cp ~/Library/DBeaverData/workspace6/General_macpro/.dbeaver/credentials-config.json \
   ~/macpro/Library/DBeaverData/workspace6/General_macpro/.dbeaver/credentials-config.json
cp ~/Library/DBeaverData/workspace6/Local/.dbeaver/credentials-config.json \
   ~/macpro/Library/DBeaverData/workspace6/Local/.dbeaver/credentials-config.json
```

### Máquina standalone (sin SSHFS)

Para una máquina sin acceso a la "origen":

```bash
mkdir -p ~/develop/source_code/globe
cd ~/develop/source_code/globe
git clone git@github.com:rodo-globe/rodo-dbeaver-workspace.git dbeaver-workspace

mkdir -p ~/Library/DBeaverData/workspace6
ln -s ~/develop/source_code/globe/dbeaver-workspace/workspace6/General_macpro ~/Library/DBeaverData/workspace6/General_macpro
ln -s ~/develop/source_code/globe/dbeaver-workspace/workspace6/Local ~/Library/DBeaverData/workspace6/Local
ln -s ~/develop/source_code/globe/dbeaver-workspace/secure ~/Library/DBeaverData/secure

# Para credentials, transferir credentials-config.json por SCP / AirDrop / lo que
# tengas a mano, dejándolo en cada uno de los paths .dbeaver/ respectivos.
```

## Día a día

**Después de editar conexiones o scripts en una máquina**:

```bash
cd ~/develop/source_code/globe/dbeaver-workspace
git status
git add -A
git commit -m "..."
git push
```

**Al sentarte en la otra**:

```bash
cd ~/develop/source_code/globe/dbeaver-workspace
git pull
```

(Claude se ocupa desde MacBook M de pullear en Mac Pro vía SSHFS, igual que con `claude-memory`.)

## Disciplina importante

**No abrir DBeaver en las dos máquinas a la vez.** Cada vez que DBeaver agrega/modifica una conexión, reescribe `data-sources.json`. Si abrís en paralelo, vas a tener conflicto de merge en ese archivo cuando hagas pull. La regla práctica:

- Trabajás en una máquina, cerrás DBeaver, commit + push.
- Vas a la otra máquina, pull, abrís DBeaver.

Si te equivocaste y tenés cambios en ambos lados, hacé merge manual de `data-sources.json` (es XML legible).

## Repos relacionados

- [`rodo-globe/rodo-claude-memory`](https://github.com/rodo-globe/rodo-claude-memory) — memoria personal de Claude Code (mismo patrón)
- [`globe-software/docker-guides`](https://github.com/globe-software/docker-guides) — guías de armado de entornos Docker
