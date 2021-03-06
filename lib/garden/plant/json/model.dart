part of garden_plant;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/garden/plant/json/model.dart

var gardenPlantModelJson = r'''
{
    "width":990,
    "height":580,
    "boxes":[
        {
            "name":"Garden",
            "entry":true,
            "x":55,
            "y":42,
            "width":80,
            "height":80,
            "items":[
                {
                    "sequence":10,
                    "name":"name",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"geoposition",
                    "category":"attribute",
                    "type":"Other",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Plant",
            "entry":false,
            "x":209,
            "y":245,
            "width":80,
            "height":80,
            "items":[
                {
                    "sequence":10,
                    "name":"name",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"picture",
                    "category":"attribute",
                    "type":"Other",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"PlantCategory",
            "entry":true,
            "x":398,
            "y":51,
            "width":100,
            "height":100,
            "items":[
                {
                    "sequence":10,
                    "name":"latinName",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"isEdible",
                    "category":"attribute",
                    "type":"bool",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":40,
                    "name":"harvestZone",
                    "category":"attribute",
                    "type":"int",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        }
    ],
    "lines":[
        {
            "box1Name":"Garden",
            "box2Name":"Plant",
            "category":"relationship",
            "internal":true,
            "box1box2Name":"plants",
            "box1box2Min":"0",
            "box1box2Max":"N",
            "box1box2Id":false,
            "box2box1Name":"garden",
            "box2box1Min":"1",
            "box2box1Max":"1",
            "box2box1Id":false
        },
        {
            "box1Name":"PlantCategory",
            "box2Name":"Plant",
            "category":"relationship",
            "internal":false,
            "box1box2Name":"plants",
            "box1box2Min":"0",
            "box1box2Max":"N",
            "box1box2Id":false,
            "box2box1Name":"plantCategory",
            "box2box1Min":"0",
            "box2box1Max":"1",
            "box2box1Id":false
        }
    ]
}
''';
  