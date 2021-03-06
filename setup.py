#!/usr/bin/env python

from setuptools import setup

setup(
    name='prosaic',
    version='1.0.0',
    description='prose scraper & cut-up poetry generator',
    url='https://github.com/nathanielksmith/prosaic',
    author='vilmibm shaksfrpease',
    author_email='nks@lambdaphil.es',
    license='GPL',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Other Audience',
        'Topic :: Artistic Software',
        'License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)',
    ],
    keywords='poetry',
    packages=['prosaic'],
    install_requires = ['pymongo==2.7.2', 'hy==0.10.0', 'nltk==3.0.0', 'numpy==1.9.0'],
    include_package_data = True,
    # TODO entry points
)
