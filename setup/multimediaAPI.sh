#!/bin/bash
#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
REPO_ROOT=$(cd $SCRIPT_DIR; cd .. ; pwd)
echo $REPO_ROOT 
# Tegra Multimedia API
mkdir -p $REPO_ROOT/third-party/multimedia_api
pushd $REPO_ROOT/third-party/multimedia_api
  curl -LO https://developer.nvidia.com/embedded/L4T/r28_Release_v3.2/t210ref_release_aarch64/Tegra_Multimedia_API_R28.3.2_aarch64.tbz2
  # 部分展開
  tar xvf ./Tegra_Multimedia_API_R28.3.2_aarch64.tbz2 --strip-components=1 tegra_multimedia_api/include/
  # ソース部分展開
  tar xvf ./Tegra_Multimedia_API_R28.3.2_aarch64.tbz2 tegra_multimedia_api/samples/common/classes
  mv tegra_multimedia_api/samples ./samples
  rm -r tegra_multimedia_api
popd
