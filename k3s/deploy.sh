#!/bin/bash

sudo kubectl apply -f namespace.yaml
sudo kubectl apply -f dnsmasq-configmap.yaml
sudo kubectl apply -f firewalld-configmap.yaml
sudo kubectl apply -f zincati-configmap.yaml
sudo kubectl apply -f dhcp-pvc.yaml
sudo kubectl apply -f daemonset.yaml
