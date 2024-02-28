part of '../../../vast_world_share.dart';

typedef StoryT = ({
  String title,
  String text,
});

class StoryComponent extends Component<StoryT> {
  @override
  String get uid => '$componentUidPrefix-$suid';

  static const suid = 'ad12f5d5-889e-4b64-9451-21bb4bd43956';

  @override
  void initv(StoryT v) => value = (title: v.title, text: v.text);

  @override
  void check() {
    argerr(text.isNotEmpty, title, 'title');
    argerr(text.isNotEmpty, text, 'text');
  }

  @override
  StoryT get empty => (title: '', text: '');

  String get title => value.title;
  String get text => value.text;

  @override
  JsonMap get valueAsJson => {'title': title, 'text': text};

  @override
  StoryT jsonAsValue(JsonMap json) => switch (json) {
        {'title': String? title, 'text': String? text} => (
            title: title ?? '',
            text: text ?? '',
          ),
        _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
      };
}
