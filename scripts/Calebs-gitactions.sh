# This workflow will do a clean installation of node dependencies, cache/restore them, build the source code and run tests across different versions of node
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-nodejs

name: test_and_build

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:

    runs-on: ubuntu-22.04

    defaults:
      run:
        working-directory: app

    steps:
    - uses: actions/checkout@v4
    - run: npm install
    - name: Install Node.js
      uses: actions/setup-node@v4
      with:
        node-version: latest
        cache: 'npm'
        cache-dependency-path: ./app/package-lock.json
    - run: npm run build --if-present
    - run: npm test
    