# Un environnement de développement reproductible, sans conteneurs

Ce dépôt contient les fichiers sources de la présentation.

## Structure

Le contenu de la présentation se trouve dans le fichier [`slides.md`](./slides.md). Elle utilise [Marpit](https://marpit.marp.app) pour gérer et générer le jeu de slides.

Les ressources additionnelles se trouvent dans le dossier [`assets`](./assets), lui-même composé de sous-dossiers:

- [`assets/font`](./slides/assets/font): fichiers de la police de caractère utilisée pour la présentation
- [`assets/images`](./slides/assets/images): images utilisées pour la présentation

Dans le dossier `assets`, on trouvera également quelques lignes de CSS pour personnaliser le rendu de Marpit.

## Génération

Pour générer les slides, il est préférable de disposer de [Nix](https://nixos.org/download). La génération devient alors aussi simple que d'exécuter le fichier `slides.md` !

### C'est de la magie noire ?

Non.

C'est simplement un trick bash bien cool !

Le fichier Markdown est en fait déclaré comme un script via une instruction shebang qui lance bash et exécute le CLI de Marpit avec les bonnes données d'entrée (ie. le contenu Markdown, sans la partie script).

Bien que j'y ai moi-même pensé par le passé, je n'avais jamais vraiment réussi à obtenir quelque chose d'acceptable. Je dois cette version finale à [Niklas Gollenstede](https://github.com/NiklasGollenstede) qui a accepté de partager avec moi son petit tour de passe-passe. Un grand merci à lui !

### Et comment ça marche ?

C'est très simple :

```bash
./slides.md

# Surveillance des changements
./slides.md -w
```

> [!NOTE]
> **Petite subtilité pour l'option `-w` !**
>
> Étant donné que le contenu du fichier est tronqué pour supprimer la partie scripting avant de l'envoyer à Marpit, cette option n'utilise pas la fonctionnalité du CLI Marpit puisqu'il n'est pas possible de surveiller les changements d'un descripteur de fichier.
>
> Afin de la remplacer, une boucle `inotifywait` est mise en place et surveille le fichier d'origine pour le regénérer lors d'un changement.
>
> Bien que fonctionnel, le rechargement automatique ne fonctionne pas dans le navigateur avec cette méthode (contrairement à l'option intégrée au CLI Marpit).

## Application de démonstration

Le code de l'application de démonstration se trouve dans une [branche séparée du dépôt](https://github.com/nicolas-goudry/reproducible-dev-env/tree/demo-app).

## Licence

[Un environnement de développement reproductible, sans conteneurs](https://github.com/nicolas-goudry/reproducible-dev-env) © 2024 par Nicolas Goudry est sous licence [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0) <img style="height:1em!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:1em!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""><img style="height:1em!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1" alt=""><img style="height:1em!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt="">
