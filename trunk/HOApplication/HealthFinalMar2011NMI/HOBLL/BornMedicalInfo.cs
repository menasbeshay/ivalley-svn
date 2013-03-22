
// Generated by MyGeneration Version # (1.2.0.7)

using System;
using MHO.DAL;

namespace MHO.BLL
{
	public class BornMedicalInfo : _BornMedicalInfo
	{
		public BornMedicalInfo()
		{
		
		}

        public void AddNewBornMedicalInfo(Guid bornEventID, string _BirthPlace, int _BornWeightKG, int _BornWeightGram,
            int _MarriageDurationYears, int _MarriageDurationMonth, int _XMarriageDurationYears, int _XMarriageDurationMonth, int _TwinsNo,
            int _OlderBornNo, int _XOlderBornNo, int _DeadBornNo, string _ObstetricsNID, string _ObstetricsFName,
            string _ObstetricsLName, int _ObstetricsRelation)
        {
            AddNew();
            BornEventID = bornEventID;
            BirthPlace = _BirthPlace;
            BornWeightKG = _BornWeightKG;
            BornWeightGram = _BornWeightGram;
            MarriageDurationYears = _MarriageDurationYears;
            MarriageDurationMonth = _MarriageDurationMonth;
            XMarriageDurationYears = _XMarriageDurationYears;
            XMarriageDurationMonth = _XMarriageDurationMonth;
            TwinsNo = _TwinsNo;
            OlderBornNo = _OlderBornNo;
            XOlderBornNo = _XOlderBornNo;
            DeadBornNo = _DeadBornNo;
            ObstetricsNID = _ObstetricsNID;
            ObstetricsFName = _ObstetricsFName;
            ObstetricsLName = _ObstetricsLName;
            ObstetricsRelation = _ObstetricsRelation;
            Save();
        }

        public void UpdateBornMedicalInfo(Guid bornEventID, string _BirthPlace, int _BornWeightKG, int _BornWeightGram,
           int _MarriageDurationYears, int _MarriageDurationMonth, int _XMarriageDurationYears, int _XMarriageDurationMonth, int _TwinsNo,
           int _OlderBornNo, int _XOlderBornNo, int _DeadBornNo, string _ObstetricsNID, string _ObstetricsFName,
           string _ObstetricsLName, int _ObstetricsRelation)
        {
            this.Where.BornEventID.Value = bornEventID;
            this.Where.BornEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            if (Query.Load())
            {
                BirthPlace = _BirthPlace;
                BornWeightKG = _BornWeightKG;
                BornWeightGram = _BornWeightGram;
                MarriageDurationYears = _MarriageDurationYears;
                MarriageDurationMonth = _MarriageDurationMonth;
                XMarriageDurationYears = _XMarriageDurationYears;
                XMarriageDurationMonth = _XMarriageDurationMonth;
                TwinsNo = _TwinsNo;
                OlderBornNo = _OlderBornNo;
                XOlderBornNo = _XOlderBornNo;
                DeadBornNo = _DeadBornNo;
                ObstetricsNID = _ObstetricsNID;
                ObstetricsFName = _ObstetricsFName;
                ObstetricsLName = _ObstetricsLName;
                ObstetricsRelation = _ObstetricsRelation;
                Save();
            }
            else
            {
                AddNewBornMedicalInfo(bornEventID, _BirthPlace, _BornWeightKG, _BornWeightGram,
            _MarriageDurationYears, _MarriageDurationMonth, _XMarriageDurationYears, _XMarriageDurationMonth, _TwinsNo,
            _OlderBornNo, _XOlderBornNo, _DeadBornNo, _ObstetricsNID, _ObstetricsFName,
            _ObstetricsLName, _ObstetricsRelation);
            }
        }
	}
}