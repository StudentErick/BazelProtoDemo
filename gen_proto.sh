SCRIPT_PATH=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

if [ ! -d $1/proto_src ]; then
    mkdir -p $1/proto_src
fi

PROTO_FILES=$(find "${SCRIPT_PATH}/proto" -name "*.proto")

protoc --proto_path=${SCRIPT_PATH}/proto --cpp_out=$1/proto_src ${PROTO_FILES}
