#!/bin/bash

sudo k3s kubectl apply -f namespace.yaml
sudo k3s kubectl apply -f dnsmasq-configmap.yaml
sudo k3s kubectl apply -f firewalld-configmap.yaml
sudo k3s kubectl apply -f zincati-configmap.yaml
sudo k3s kubectl apply -f daemonset.yaml
sudo k3s kubectl apply -f https://github.com/rancher/system-upgrade-controller/releases/latest/download/system-upgrade-controller.yaml
sudo k3s kubectl wait deployment -n system-upgrade system-upgrade-controller --for condition=Available=True
sudo k3s kubectl apply -f upgrade-plan.yaml
