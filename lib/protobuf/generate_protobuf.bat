@echo Generating protobuf for Product...

@setlocal

rmdir /S /Q "..\src\generated"

Set "in=protos"
Set "out=..\src\generated\%in%"


@Set "suffix=google\protobuf"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=google\type"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*


@Set "suffix=syrokomskyi"
@mkdir "%out%\%suffix%"
@rem protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=syrokomskyi\type"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*


@Set "suffix=vw"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*


@echo You should add all new generated files to `lib\vast_world_protos.dart` manually. Sorry.

@endlocal
