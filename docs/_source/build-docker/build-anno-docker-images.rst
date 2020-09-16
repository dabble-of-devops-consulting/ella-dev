****************************************************
Build Ella Docker Images
****************************************************

Build Ella
########################

At the time of writing we are using ella tag 1.11.1

.. code-block:: bash 
    :linenos:

    git clone https://gitlab.com/alleles/ella
    cd ella
    export BRANCH=1.11.1
    git checkout 1.11.1
    make build

This will create an image `local/ella-1.11.1:latest`.

Upload the image to your preferred docker repo with:

.. code-block:: bash 
    :linenos:

    docker tag local/ella-1.11.1:latest dabbleofdevops/ella:1.11.1
    docker tag local/ella-1.11.1:latest dabbleofdevops/ella:latest
    docker push dabbleofdevops/ella:latest
    docker push dabbleofdevops/ella:1.11.1

Build Ella Annotation
########################

Build the Ella Annotation Service

.. code-block:: bash
   :linenos:

   git clone https://gitlab.com/alleles/ella-anno
   cd ella-anno
   git checkout v2.0.3 
   echo "pyrsistent==0.16.0" >> pip-requirements
   make build

This will create an image called `local/anno-v2.0.3:latest`.

.. code-block:: bash 
    :linenos:

    docker tag local/anno-v2.0.3:latest dabbleofdevops/ella-anno:v2.0.3
    docker tag local/anno-v2.0.3:latest dabbleofdevops/ella-anno:latest
    docker push dabbleofdevops/ella-anno:latest
    docker push dabbleofdevops/ella-anno:v2.0.3
