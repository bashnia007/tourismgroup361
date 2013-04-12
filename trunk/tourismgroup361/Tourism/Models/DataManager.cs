using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tourism.Models
{
    public class DataManager
    {
        private readonly MuseumsDBEntities3 db;
        private readonly int[] _standartIdList;
        public SelectList Types{get; set; }

        public DataManager()
        {
            db = new MuseumsDBEntities3(); 
            // убрать это непотребство!
            _standartIdList = new int[]
                {
                    306, //The State Museum of the History of Religion
                    311, //The State Museum-Reserv "Petergof"
                    313, //The State Museum Monument "Isaakievsky Sobor"
                    314, //The State Russian Museum
                    315, //The State Hermitage
                    317, //The House of Peter I
                    328, //The Memorial Ship Cruiser "Aurora"
                    396, //The Museum-Reserve "Petropavlovskaya krepost"
                    407, //The Museum-Monument "Spas na Krovi"
                };

            Types = new SelectList(new[]
                {
                    new {Id = 1, Name = "исторические и историко-бытовые"},
                    new {Id = 2, Name = "военные и военно-исторические"},
                    new {Id = 3, Name = "естественно-научные и технические"},
                    new {Id = 5, Name = "литературные"},
                    new {Id = 6, Name = "историко-краеведческий"},
                    new {Id = 7, Name = "художественные"},
                    new {Id = 8, Name = "выставочные залы"},
                    new {Id = 9, Name = "технические"},
                    new {Id = 10, Name = "театрально-музыкальные"},
                    new {Id = 11, Name = "дворцы-музеи, усадьбы, парки и заповедники"},
                    new {Id = 12, Name = "истории промышленных предприятий"},
                    new {Id = 13, Name = "истории промышленных предприятий"},
                    new {Id = 14, Name = "истории учебных заведений"},
                    new {Id = 15, Name = "этнографические"},
                },
                "Id", "Name", 1);
        }

        public ICollection<Museum> GetStandartMuseum()
        {
            var res = new List<Museum>();
            for (var i = 0; i < _standartIdList.Count(); i++)
            {
                res.Add(getMuseumForId(_standartIdList[i]));
            }
            return res;
        }

        private Museum getMuseumForId(int id)
        {
            return db.Museums.SingleOrDefault(it => it.ID == id);
        }

        public ICollection<Museum> GetMuseumForType(string type)
        {
            var res = (from museum in db.Museums
                       where museum.type == type
                       select museum);
            return res.ToList();
        }

        public List<Museum> Search(string name)
        {
            var allMuseums = (from museum in db.Museums select museum).ToList();
            return allMuseums;
        }
    }
}