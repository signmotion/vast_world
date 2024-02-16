@echo Generating protobuf for Product...

@setlocal

rmdir /S /Q "..\src\share\generated"

Set "in=protos"
Set "out=..\src\share\generated\%in%"


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


@Set "suffix=vw\share"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\share\requests"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\share\responses"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\hermes"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\maia"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\runes\share"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\runes\fantasy_journey_conceiver"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*

@Set "suffix=vw\runes\fantasy_journey_conceiver\services"
@mkdir "%out%\%suffix%"
protoc --dart_out=grpc:%out% -I%in% %in%\%suffix%\*


@echo You should add all new generated files to `lib\vast_world_protos.dart` manually. Sorry.

@endlocal
