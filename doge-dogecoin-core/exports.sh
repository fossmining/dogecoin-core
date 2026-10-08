export APP_DOGECOIN_NODE_IP="doge-dogecoin-core_dogecoind_1"
export APP_DOGECOIN_DATA_DIR="${EXPORTS_APP_DATA_DIR}/dogecoin"

export APP_DOGECOIN_P2P_PORT="22556"
export APP_DOGECOIN_RPC_PORT="22555"
export APP_DOGECOIN_ZMQ_HASHBLOCK_PORT="28332"
export APP_DOGECOIN_ZMQ_RAWBLOCK_PORT="28333"
export APP_DOGECOIN_ZMQ_RAWTX_PORT="28334"

export APP_DOGECOIN_NETWORK="mainnet"
export APP_DOGECOIN_RPC_USER="umbrel"
export APP_DOGECOIN_RPC_PASS="$(derive_entropy "${app_entropy_identifier}-rpc-password")"
