part of '../../../vast_world.dart';

typedef StoryT = ({
  String text,
});

class StoryComponent extends VComponent<StoryT> {
  @override
  void initv(StoryT v) => value = (text: v.text);

  @override
  void check() {
    argerr(text.isNotEmpty, text, 'text');
  }

  @override
  StoryT get empty => (text: '');

  String get text => value.text;
}
