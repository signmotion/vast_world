part of '../../../vast_world_share.dart';

typedef StoryT = ({
  String text,
});

class StoryComponent extends Component<StoryT> {
  @override
  String get uid => 'ad12f5d5-889e-4b64-9451-21bb4bd43956';

  @override
  void initv(StoryT v) => value = (text: v.text);

  @override
  void check() {
    argerr(text.isNotEmpty, text, 'text');
  }

  @override
  StoryT get empty => (text: '');

  String get text => value.text;

  @override
  JsonMap get valueAsJson => {'text': text};

  @override
  StoryT jsonAsValue(JsonMap json) => switch (json) {
        {'text': String? text} => (text: text ?? '',),
        _ => throw ArgumentError(json.sjson),
      };
}
