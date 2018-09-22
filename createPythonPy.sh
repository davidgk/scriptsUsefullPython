#!/usr/bin/env bash
# We assume we have already installed pip and pipenv if not ; do it !
PROJECT=$1;

ORIGIN=${pwd};

echo "Create Proyect folder";

mkdir $PROJECT;
cd $PROJECT;

echo "Run Pipenv";
pipenv install

echo "Create Source And tests";
mkdir src;
mkdir test;

cd test
echo "
import unittest
from unittest import TestCase
from src.$PROJECT import $PROJECT


class Test$PROJECT(TestCase):

    def test_1(self):
    	resultExpected = $PROJECT(1, 1).result
    	self.assertEqual(resultExpected, 2)

    if __name__ == '__main__':
        unittest.main()

" > test_$PROJECT.py;

cd ../src
echo "

class $PROJECT:

    def __init__(self, valueA, valueB):
        self.result = self.execute(valueA, valueB)

    def execute(self, n, b):
    	return n + b

" > $PROJECT.py;

echo "If you are going to develope it in Pycharm run pipenv --venv to get where virtualenv is created for this guy "

cd $PROJECT