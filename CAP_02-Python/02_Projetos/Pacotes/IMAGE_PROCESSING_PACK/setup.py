# O Codigo apresentado durante a atividade é de autoria de Karine Kato e fou apresentado com intuito pedagogico
#  Nesta parte do setup devemos inserir as informações gerais sor=bre o pacote
#

from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="package_name",
    version="0.0.1",
    author="Gilcimar Gomes",
    author_email="aguiar.gilcimar@gmail.com",
    description="Version for test, processing to image - Project development by Karina Kato - teacher for DIO",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="my_github_repository_project_link"
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.8',
)