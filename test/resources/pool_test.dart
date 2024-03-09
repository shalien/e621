import 'dart:convert';
import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  const String example = '''{
      "id": 39599,
  "name": "How_To_Make_A_Girlfriend_by_SinnerPen",
  "created_at": "2024-03-08T07:16:02.388+01:00",
  "updated_at": "2024-03-09T08:06:33.356+01:00",
  "creator_id": 1462141,
  "description": "",
  "is_active": true,
  "category": "series",
  "post_ids": [
  4644608,
  4644610,
  4644611,
  4644613,
  4644614,
  4644615,
  4644616,
  4644617,
  4644618,
  4644619,
  4644620,
  4645275,
  4646321,
  4646323,
  4646322,
  4646324,
  4646325,
  4646326,
  4646327,
  4646329,
  4646328,
  4646330,
  4646331,
  4646332,
  4646421,
  4646419,
  4646420,
  4646422,
  4646423
  ],
  "creator_name": "throwaway38290465",
  "post_count": 29
}''';

  const String exampleList = '''[
  {
    "id": 39599,
    "name": "How_To_Make_A_Girlfriend_by_SinnerPen",
    "created_at": "2024-03-08T07:16:02.388+01:00",
    "updated_at": "2024-03-09T08:06:33.356+01:00",
    "creator_id": 1462141,
    "description": "",
    "is_active": true,
    "category": "series",
    "post_ids": [
      4644608,
      4644610,
      4644611,
      4644613,
      4644614,
      4644615,
      4644616,
      4644617,
      4644618,
      4644619,
      4644620,
      4645275,
      4646321,
      4646323,
      4646322,
      4646324,
      4646325,
      4646326,
      4646327,
      4646329,
      4646328,
      4646330,
      4646331,
      4646332,
      4646421,
      4646419,
      4646420,
      4646422,
      4646423
    ],
    "creator_name": "throwaway38290465",
    "post_count": 29
  },
  {
    "id": 26461,
    "name": "Passionate_Affection_by_booboo",
    "created_at": "2021-11-29T01:35:01.806+01:00",
    "updated_at": "2024-03-09T08:05:28.956+01:00",
    "creator_id": 488034,
    "description": "PNG pages provided by the artist on their Twitter profile: https://drive.google.com/drive/mobile/folders/1wgX7KxgQiEG13dAC1Ui7g4rS4Gt9C99x?usp=sharing",
    "is_active": true,
    "category": "series",
    "post_ids": [
      3048401,
      3048419,
      3048447,
      3048465,
      3055643,
      3055652,
      3055655,
      4272174,
      4272190,
      4272198,
      4273088,
      4273406,
      4273592,
      4273593,
      4273641,
      4273759,
      4273779,
      4273884,
      4273885,
      4273919,
      4273973,
      4273979,
      4273989,
      4274002,
      4274049,
      4276046,
      4276055,
      4276068,
      4276093,
      4276108,
      4278087,
      4278202,
      4278219,
      4281774,
      4286744,
      4286764,
      4286772,
      4286782,
      4286795,
      4286840,
      4286916,
      4294550,
      4294565,
      4294570,
      4294582,
      4294598,
      4294603,
      4294611,
      4294622,
      4308103,
      4328925,
      4328926,
      4330311,
      4353384,
      4353385,
      4353397,
      4353398,
      4353399,
      4353416,
      4353425,
      4354472,
      4354668,
      4355213,
      4355214,
      4358295,
      4360653,
      4360654,
      4360747,
      4360748,
      4360762,
      4370760,
      4370761,
      4370763,
      4370781,
      4370782,
      4370783,
      4370784,
      4370792,
      4370793,
      4370804,
      4372752,
      4376282,
      4376390,
      4376427,
      4376473,
      4376474,
      4376475,
      4376477,
      4378600,
      4378601,
      4389495,
      4393198,
      4393200,
      4393207,
      4393208,
      4393212,
      4393221,
      4393222,
      4393223,
      4394852,
      4401570,
      4446275,
      4446285,
      4446292,
      4463338,
      4468510,
      4488454,
      4488541,
      4488626,
      4488815,
      4488934,
      4489813,
      4497149,
      4497283,
      4497278,
      4497320,
      4497368,
      4497654,
      4498515,
      4499395,
      4508948,
      4509052,
      4509099,
      4509353,
      4509716,
      4509729,
      4509751,
      4509906,
      4509908,
      4509909,
      4511206,
      4511254,
      4511533,
      4517369,
      4543329,
      4543330,
      4543379,
      4543520,
      4607850,
      4610746,
      4616664,
      4622516,
      4622538,
      4624921,
      4626373,
      4626386,
      4626412,
      4626413,
      4628966,
      4632455,
      4632937,
      4646403,
      4646407,
      4646410,
      4646415,
      4646418
    ],
    "creator_name": "OriginalName333",
    "post_count": 156
  }]''';

  group('Pool Group Test', () {
    test('Parse Pool', () {
      final Pool pool = Pool.fromMap(json.decode(example));

      expect(pool.id, 39599);
      expect(pool.name, 'How_To_Make_A_Girlfriend_by_SinnerPen');
      expect(pool.createdAt, '2024-03-08T07:16:02.388+01:00');
      expect(pool.updatedAt, '2024-03-09T08:06:33.356+01:00');
      expect(pool.creatorId, 1462141);
      expect(pool.description, '');
      expect(pool.isActive, true);
      expect(pool.category, 'series');
      expect(pool.postIds, [
        4644608,
        4644610,
        4644611,
        4644613,
        4644614,
        4644615,
        4644616,
        4644617,
        4644618,
        4644619,
        4644620,
        4645275,
        4646321,
        4646323,
        4646322,
        4646324,
        4646325,
        4646326,
        4646327,
        4646329,
        4646328,
        4646330,
        4646331,
        4646332,
        4646421,
        4646419,
        4646420,
        4646422,
        4646423
      ]);
      expect(pool.creatorName, 'throwaway38290465');
      expect(pool.postCount, 29);
    });

    test('Parse Pool List', () {
      List<dynamic> maps = json.decode(exampleList);

      final List<Pool> pools = maps.map((e) => Pool.fromMap(e)).toList();

      expect(pools.length, 2);
    });

    test('Parse Pool Response', () {
      File responseFile = File('test/assets/pool_response.json');

      final List<dynamic> maps = json.decode(responseFile.readAsStringSync());

      final List<Pool> pools = maps.map((e) => Pool.fromMap(e)).toList();

      expect(pools.length, maps.length);
    });
  });
}