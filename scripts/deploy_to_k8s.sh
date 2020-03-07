#!/bin/sh

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
mkdir ${HOME}/.kube
cp ./k8s/config.yaml ${HOME}/.kube/config
cat ${HOME}/.kube/config
cd ${HOME}/.kube
sed -i 's/KUBE_CLUSTER_NAME/'"$KUBE_CLUSTER_NAME"'/g' config
sed -i 's/KUBE_CLUSTER_CERTIFICATE/'"$KUBE_CLUSTER_CERTIFICATE"'/g' config
sed -i 's|KUBE_CLUSTER_SERVER|'"$KUBE_CLUSTER_SERVER"'|g' config
sed -i 's/KUBE_ADMIN_PWD/'"$KUBE_ADMIN_PWD"'/g' config
kubectl config use-context $KUBE_CLUSTER_NAME
kubectl cluster-info
cd ${TRAVIS_BUILD_DIR}
skaffold diagnose
skaffold run