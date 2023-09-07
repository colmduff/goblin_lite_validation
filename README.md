# GOBLIN lite with JupyterLab Docker support

Docker support for the open-source [goblin_lite validation tool](https://github.com/colmduff/goblin_validation_py). This repository automatically builds and publishes the image `colmduff/goblin_lite_validation` to DockerHub. The image is intended to be used for development with [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/#) to validate goblin_lite model against National Inventory data.

## Usage

1. Install and configure Docker Desktop for your operating system following the instructions on the [official website](https://www.docker.com/get-started).
2. Once docker is installed, open a command-line interface and pull the `colmduff/goblin_lite_validation` docker image by running the following command:

    ```{prompt} bash \$ auto
    $ docker pull colmduff/goblin_lite_validation
    ```

3. From the command line, navigate to the directory you want to develop in (this can be called anything and located wherever you like on your file system).
4. Start a new container from that directory by running the following command from the command line:

    ```{prompt} bash \$ auto
    $ docker run -it \
        -p 8888:8888 \
        -v "${PWD}":/home/jovyan/work \
        colmduff/goblin_lite_validation
    ```
    
    ```{tip}
    In the command above, `-it` creates an interactive bash shell in the container, `-p` binds port 8888 in the container to port 8888 on the host machine. You can read more about the `docker run` command and its arguments in the Docker command-line interface [documentation](https://docs.docker.com/engine/reference/commandline/run/).
    ```
    
5. Copy, or control click, the unique URL printed to screen (that looks something like this: `http://127.0.0.1:8888 token=a66403740c2069691b09b09eb554db91bd90af12315566d0`) to your browser. This will open an instance of JupyterLab running inside a Docker container.
6. Navigate to the `work` directory in JupyterLab. This is where you can develop and create new files and directories that will persist in the directory from where you launched your container.
7. When you've finished a working session, you can exit JupyterLab, and kill your terminal, and your container will persist for you to use later. To re-enter the container at a later time, first find its ID:

    ```{prompt} bash \$ auto
    $ docker ps -a
    ```
    
    ```md
    CONTAINER ID   IMAGE
    653daa2cd48e   colmduff/goblin_lite_validation
    ```
    
8. Re-enter the container using the `docker start`command combined with the container's ID:

    ```{prompt} bash \$ auto
    $ docker start -a 653daa2cd48e
    ```
    
9. If you want to completely remove the container, use the following command:

    ```{prompt} bash \$ auto
    $ docker rm 653daa2cd48e
    ```
