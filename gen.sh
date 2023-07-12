arr_directory=("order_service" "product_service")
echo "Step 1: Generate proto code golang"
{
  for item in ${arr_directory[@]}; do
  echo "Generating protobuf for service $item"
  mkdir -p $item
  protoc --proto_path=. \
 	       --go_out=paths=source_relative:. \
 	       --go-grpc_out=paths=source_relative:. \
	       $item/$item.proto
  done
} || {
  echo "FAIL!"
}