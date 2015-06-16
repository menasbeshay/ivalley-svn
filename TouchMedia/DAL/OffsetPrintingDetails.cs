
/*
'===============================================================================
'  Generated From - CSharp_dOOdads_BusinessEntity.vbgen
' 
'  ** IMPORTANT  ** 
'  How to Generate your stored procedures:
' 
'  SQL        = SQL_StoredProcs.vbgen
'  ACCESS     = Access_StoredProcs.vbgen
'  ORACLE     = Oracle_StoredProcs.vbgen
'  FIREBIRD   = FirebirdStoredProcs.vbgen
'  POSTGRESQL = PostgreSQL_StoredProcs.vbgen
'
'  The supporting base class SqlClientEntity is in the Architecture directory in "dOOdads".
'  
'  This object is 'abstract' which means you need to inherit from it to be able
'  to instantiate it.  This is very easilly done. You can override properties and
'  methods in your derived class, this allows you to regenerate this class at any
'  time and not worry about overwriting custom code. 
'
'  NEVER EDIT THIS FILE.
'
'  public class YourObject :  _YourObject
'  {
'
'  }
'
'===============================================================================
*/

// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DAL
{
	public abstract class _OffsetPrintingDetails : SqlClientEntity
	{
		public _OffsetPrintingDetails()
		{
			this.QuerySource = "OffsetPrintingDetails";
			this.MappingName = "OffsetPrintingDetails";

		}	

		//=================================================================
		//  public Overrides void AddNew()
		//=================================================================
		//
		//=================================================================
		public override void AddNew()
		{
			base.AddNew();
			
		}
		
		
		public override void FlushData()
		{
			this._whereClause = null;
			this._aggregateClause = null;
			base.FlushData();
		}
		
		//=================================================================
		//  	public Function LoadAll() As Boolean
		//=================================================================
		//  Loads all of the records in the database, and sets the currentRow to the first row
		//=================================================================
		public bool LoadAll() 
		{
			ListDictionary parameters = null;
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_OffsetPrintingDetailsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int OffsetPrintingDetailsID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.OffsetPrintingDetailsID, OffsetPrintingDetailsID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_OffsetPrintingDetailsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter OffsetPrintingDetailsID
			{
				get
				{
					return new SqlParameter("@OffsetPrintingDetailsID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter JobOrderID
			{
				get
				{
					return new SqlParameter("@JobOrderID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter PaperKindID
			{
				get
				{
					return new SqlParameter("@PaperKindID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter GSMID
			{
				get
				{
					return new SqlParameter("@GSMID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter PrintingHouseID
			{
				get
				{
					return new SqlParameter("@PrintingHouseID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter FinishID
			{
				get
				{
					return new SqlParameter("@FinishID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter JobOrderStatusID
			{
				get
				{
					return new SqlParameter("@JobOrderStatusID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter CreatedBy
			{
				get
				{
					return new SqlParameter("@CreatedBy", SqlDbType.UniqueIdentifier, 0);
				}
			}
			
			public static SqlParameter CreatedDate
			{
				get
				{
					return new SqlParameter("@CreatedDate", SqlDbType.DateTime, 0);
				}
			}
			
			public static SqlParameter UpdatedBy
			{
				get
				{
					return new SqlParameter("@UpdatedBy", SqlDbType.UniqueIdentifier, 0);
				}
			}
			
			public static SqlParameter LastUpdatedDate
			{
				get
				{
					return new SqlParameter("@LastUpdatedDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string OffsetPrintingDetailsID = "OffsetPrintingDetailsID";
            public const string JobOrderID = "JobOrderID";
            public const string PaperKindID = "PaperKindID";
            public const string GSMID = "GSMID";
            public const string PrintingHouseID = "PrintingHouseID";
            public const string FinishID = "FinishID";
            public const string JobOrderStatusID = "JobOrderStatusID";
            public const string CreatedBy = "CreatedBy";
            public const string CreatedDate = "CreatedDate";
            public const string UpdatedBy = "UpdatedBy";
            public const string LastUpdatedDate = "LastUpdatedDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[OffsetPrintingDetailsID] = _OffsetPrintingDetails.PropertyNames.OffsetPrintingDetailsID;
					ht[JobOrderID] = _OffsetPrintingDetails.PropertyNames.JobOrderID;
					ht[PaperKindID] = _OffsetPrintingDetails.PropertyNames.PaperKindID;
					ht[GSMID] = _OffsetPrintingDetails.PropertyNames.GSMID;
					ht[PrintingHouseID] = _OffsetPrintingDetails.PropertyNames.PrintingHouseID;
					ht[FinishID] = _OffsetPrintingDetails.PropertyNames.FinishID;
					ht[JobOrderStatusID] = _OffsetPrintingDetails.PropertyNames.JobOrderStatusID;
					ht[CreatedBy] = _OffsetPrintingDetails.PropertyNames.CreatedBy;
					ht[CreatedDate] = _OffsetPrintingDetails.PropertyNames.CreatedDate;
					ht[UpdatedBy] = _OffsetPrintingDetails.PropertyNames.UpdatedBy;
					ht[LastUpdatedDate] = _OffsetPrintingDetails.PropertyNames.LastUpdatedDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string OffsetPrintingDetailsID = "OffsetPrintingDetailsID";
            public const string JobOrderID = "JobOrderID";
            public const string PaperKindID = "PaperKindID";
            public const string GSMID = "GSMID";
            public const string PrintingHouseID = "PrintingHouseID";
            public const string FinishID = "FinishID";
            public const string JobOrderStatusID = "JobOrderStatusID";
            public const string CreatedBy = "CreatedBy";
            public const string CreatedDate = "CreatedDate";
            public const string UpdatedBy = "UpdatedBy";
            public const string LastUpdatedDate = "LastUpdatedDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[OffsetPrintingDetailsID] = _OffsetPrintingDetails.ColumnNames.OffsetPrintingDetailsID;
					ht[JobOrderID] = _OffsetPrintingDetails.ColumnNames.JobOrderID;
					ht[PaperKindID] = _OffsetPrintingDetails.ColumnNames.PaperKindID;
					ht[GSMID] = _OffsetPrintingDetails.ColumnNames.GSMID;
					ht[PrintingHouseID] = _OffsetPrintingDetails.ColumnNames.PrintingHouseID;
					ht[FinishID] = _OffsetPrintingDetails.ColumnNames.FinishID;
					ht[JobOrderStatusID] = _OffsetPrintingDetails.ColumnNames.JobOrderStatusID;
					ht[CreatedBy] = _OffsetPrintingDetails.ColumnNames.CreatedBy;
					ht[CreatedDate] = _OffsetPrintingDetails.ColumnNames.CreatedDate;
					ht[UpdatedBy] = _OffsetPrintingDetails.ColumnNames.UpdatedBy;
					ht[LastUpdatedDate] = _OffsetPrintingDetails.ColumnNames.LastUpdatedDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string OffsetPrintingDetailsID = "s_OffsetPrintingDetailsID";
            public const string JobOrderID = "s_JobOrderID";
            public const string PaperKindID = "s_PaperKindID";
            public const string GSMID = "s_GSMID";
            public const string PrintingHouseID = "s_PrintingHouseID";
            public const string FinishID = "s_FinishID";
            public const string JobOrderStatusID = "s_JobOrderStatusID";
            public const string CreatedBy = "s_CreatedBy";
            public const string CreatedDate = "s_CreatedDate";
            public const string UpdatedBy = "s_UpdatedBy";
            public const string LastUpdatedDate = "s_LastUpdatedDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int OffsetPrintingDetailsID
	    {
			get
	        {
				return base.Getint(ColumnNames.OffsetPrintingDetailsID);
			}
			set
	        {
				base.Setint(ColumnNames.OffsetPrintingDetailsID, value);
			}
		}

		public virtual int JobOrderID
	    {
			get
	        {
				return base.Getint(ColumnNames.JobOrderID);
			}
			set
	        {
				base.Setint(ColumnNames.JobOrderID, value);
			}
		}

		public virtual int PaperKindID
	    {
			get
	        {
				return base.Getint(ColumnNames.PaperKindID);
			}
			set
	        {
				base.Setint(ColumnNames.PaperKindID, value);
			}
		}

		public virtual int GSMID
	    {
			get
	        {
				return base.Getint(ColumnNames.GSMID);
			}
			set
	        {
				base.Setint(ColumnNames.GSMID, value);
			}
		}

		public virtual int PrintingHouseID
	    {
			get
	        {
				return base.Getint(ColumnNames.PrintingHouseID);
			}
			set
	        {
				base.Setint(ColumnNames.PrintingHouseID, value);
			}
		}

		public virtual int FinishID
	    {
			get
	        {
				return base.Getint(ColumnNames.FinishID);
			}
			set
	        {
				base.Setint(ColumnNames.FinishID, value);
			}
		}

		public virtual int JobOrderStatusID
	    {
			get
	        {
				return base.Getint(ColumnNames.JobOrderStatusID);
			}
			set
	        {
				base.Setint(ColumnNames.JobOrderStatusID, value);
			}
		}

		public virtual Guid CreatedBy
	    {
			get
	        {
				return base.GetGuid(ColumnNames.CreatedBy);
			}
			set
	        {
				base.SetGuid(ColumnNames.CreatedBy, value);
			}
		}

		public virtual DateTime CreatedDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.CreatedDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.CreatedDate, value);
			}
		}

		public virtual Guid UpdatedBy
	    {
			get
	        {
				return base.GetGuid(ColumnNames.UpdatedBy);
			}
			set
	        {
				base.SetGuid(ColumnNames.UpdatedBy, value);
			}
		}

		public virtual DateTime LastUpdatedDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.LastUpdatedDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.LastUpdatedDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_OffsetPrintingDetailsID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.OffsetPrintingDetailsID) ? string.Empty : base.GetintAsString(ColumnNames.OffsetPrintingDetailsID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.OffsetPrintingDetailsID);
				else
					this.OffsetPrintingDetailsID = base.SetintAsString(ColumnNames.OffsetPrintingDetailsID, value);
			}
		}

		public virtual string s_JobOrderID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.JobOrderID) ? string.Empty : base.GetintAsString(ColumnNames.JobOrderID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.JobOrderID);
				else
					this.JobOrderID = base.SetintAsString(ColumnNames.JobOrderID, value);
			}
		}

		public virtual string s_PaperKindID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PaperKindID) ? string.Empty : base.GetintAsString(ColumnNames.PaperKindID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PaperKindID);
				else
					this.PaperKindID = base.SetintAsString(ColumnNames.PaperKindID, value);
			}
		}

		public virtual string s_GSMID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GSMID) ? string.Empty : base.GetintAsString(ColumnNames.GSMID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GSMID);
				else
					this.GSMID = base.SetintAsString(ColumnNames.GSMID, value);
			}
		}

		public virtual string s_PrintingHouseID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PrintingHouseID) ? string.Empty : base.GetintAsString(ColumnNames.PrintingHouseID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PrintingHouseID);
				else
					this.PrintingHouseID = base.SetintAsString(ColumnNames.PrintingHouseID, value);
			}
		}

		public virtual string s_FinishID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.FinishID) ? string.Empty : base.GetintAsString(ColumnNames.FinishID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.FinishID);
				else
					this.FinishID = base.SetintAsString(ColumnNames.FinishID, value);
			}
		}

		public virtual string s_JobOrderStatusID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.JobOrderStatusID) ? string.Empty : base.GetintAsString(ColumnNames.JobOrderStatusID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.JobOrderStatusID);
				else
					this.JobOrderStatusID = base.SetintAsString(ColumnNames.JobOrderStatusID, value);
			}
		}

		public virtual string s_CreatedBy
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CreatedBy) ? string.Empty : base.GetGuidAsString(ColumnNames.CreatedBy);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CreatedBy);
				else
					this.CreatedBy = base.SetGuidAsString(ColumnNames.CreatedBy, value);
			}
		}

		public virtual string s_CreatedDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CreatedDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.CreatedDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CreatedDate);
				else
					this.CreatedDate = base.SetDateTimeAsString(ColumnNames.CreatedDate, value);
			}
		}

		public virtual string s_UpdatedBy
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UpdatedBy) ? string.Empty : base.GetGuidAsString(ColumnNames.UpdatedBy);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UpdatedBy);
				else
					this.UpdatedBy = base.SetGuidAsString(ColumnNames.UpdatedBy, value);
			}
		}

		public virtual string s_LastUpdatedDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.LastUpdatedDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.LastUpdatedDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.LastUpdatedDate);
				else
					this.LastUpdatedDate = base.SetDateTimeAsString(ColumnNames.LastUpdatedDate, value);
			}
		}


		#endregion		
	
		#region Where Clause
		public class WhereClause
		{
			public WhereClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffWhereParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffWhereParameter(this);
					}

					return _tearOff;
				}
			}

			#region WhereParameter TearOff's
			public class TearOffWhereParameter
			{
				public TearOffWhereParameter(WhereClause clause)
				{
					this._clause = clause;
				}
				
				
				public WhereParameter OffsetPrintingDetailsID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.OffsetPrintingDetailsID, Parameters.OffsetPrintingDetailsID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter JobOrderID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.JobOrderID, Parameters.JobOrderID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter PaperKindID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PaperKindID, Parameters.PaperKindID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter GSMID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GSMID, Parameters.GSMID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter PrintingHouseID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PrintingHouseID, Parameters.PrintingHouseID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter FinishID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.FinishID, Parameters.FinishID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter JobOrderStatusID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.JobOrderStatusID, Parameters.JobOrderStatusID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CreatedBy
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CreatedBy, Parameters.CreatedBy);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CreatedDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CreatedDate, Parameters.CreatedDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter UpdatedBy
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UpdatedBy, Parameters.UpdatedBy);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter LastUpdatedDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.LastUpdatedDate, Parameters.LastUpdatedDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter OffsetPrintingDetailsID
		    {
				get
		        {
					if(_OffsetPrintingDetailsID_W == null)
	        	    {
						_OffsetPrintingDetailsID_W = TearOff.OffsetPrintingDetailsID;
					}
					return _OffsetPrintingDetailsID_W;
				}
			}

			public WhereParameter JobOrderID
		    {
				get
		        {
					if(_JobOrderID_W == null)
	        	    {
						_JobOrderID_W = TearOff.JobOrderID;
					}
					return _JobOrderID_W;
				}
			}

			public WhereParameter PaperKindID
		    {
				get
		        {
					if(_PaperKindID_W == null)
	        	    {
						_PaperKindID_W = TearOff.PaperKindID;
					}
					return _PaperKindID_W;
				}
			}

			public WhereParameter GSMID
		    {
				get
		        {
					if(_GSMID_W == null)
	        	    {
						_GSMID_W = TearOff.GSMID;
					}
					return _GSMID_W;
				}
			}

			public WhereParameter PrintingHouseID
		    {
				get
		        {
					if(_PrintingHouseID_W == null)
	        	    {
						_PrintingHouseID_W = TearOff.PrintingHouseID;
					}
					return _PrintingHouseID_W;
				}
			}

			public WhereParameter FinishID
		    {
				get
		        {
					if(_FinishID_W == null)
	        	    {
						_FinishID_W = TearOff.FinishID;
					}
					return _FinishID_W;
				}
			}

			public WhereParameter JobOrderStatusID
		    {
				get
		        {
					if(_JobOrderStatusID_W == null)
	        	    {
						_JobOrderStatusID_W = TearOff.JobOrderStatusID;
					}
					return _JobOrderStatusID_W;
				}
			}

			public WhereParameter CreatedBy
		    {
				get
		        {
					if(_CreatedBy_W == null)
	        	    {
						_CreatedBy_W = TearOff.CreatedBy;
					}
					return _CreatedBy_W;
				}
			}

			public WhereParameter CreatedDate
		    {
				get
		        {
					if(_CreatedDate_W == null)
	        	    {
						_CreatedDate_W = TearOff.CreatedDate;
					}
					return _CreatedDate_W;
				}
			}

			public WhereParameter UpdatedBy
		    {
				get
		        {
					if(_UpdatedBy_W == null)
	        	    {
						_UpdatedBy_W = TearOff.UpdatedBy;
					}
					return _UpdatedBy_W;
				}
			}

			public WhereParameter LastUpdatedDate
		    {
				get
		        {
					if(_LastUpdatedDate_W == null)
	        	    {
						_LastUpdatedDate_W = TearOff.LastUpdatedDate;
					}
					return _LastUpdatedDate_W;
				}
			}

			private WhereParameter _OffsetPrintingDetailsID_W = null;
			private WhereParameter _JobOrderID_W = null;
			private WhereParameter _PaperKindID_W = null;
			private WhereParameter _GSMID_W = null;
			private WhereParameter _PrintingHouseID_W = null;
			private WhereParameter _FinishID_W = null;
			private WhereParameter _JobOrderStatusID_W = null;
			private WhereParameter _CreatedBy_W = null;
			private WhereParameter _CreatedDate_W = null;
			private WhereParameter _UpdatedBy_W = null;
			private WhereParameter _LastUpdatedDate_W = null;

			public void WhereClauseReset()
			{
				_OffsetPrintingDetailsID_W = null;
				_JobOrderID_W = null;
				_PaperKindID_W = null;
				_GSMID_W = null;
				_PrintingHouseID_W = null;
				_FinishID_W = null;
				_JobOrderStatusID_W = null;
				_CreatedBy_W = null;
				_CreatedDate_W = null;
				_UpdatedBy_W = null;
				_LastUpdatedDate_W = null;

				this._entity.Query.FlushWhereParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffWhereParameter _tearOff;
			
		}
	
		public WhereClause Where
		{
			get
			{
				if(_whereClause == null)
				{
					_whereClause = new WhereClause(this);
				}
		
				return _whereClause;
			}
		}
		
		private WhereClause _whereClause = null;	
		#endregion
	
		#region Aggregate Clause
		public class AggregateClause
		{
			public AggregateClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffAggregateParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffAggregateParameter(this);
					}

					return _tearOff;
				}
			}

			#region AggregateParameter TearOff's
			public class TearOffAggregateParameter
			{
				public TearOffAggregateParameter(AggregateClause clause)
				{
					this._clause = clause;
				}
				
				
				public AggregateParameter OffsetPrintingDetailsID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.OffsetPrintingDetailsID, Parameters.OffsetPrintingDetailsID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter JobOrderID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.JobOrderID, Parameters.JobOrderID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter PaperKindID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PaperKindID, Parameters.PaperKindID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter GSMID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GSMID, Parameters.GSMID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter PrintingHouseID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PrintingHouseID, Parameters.PrintingHouseID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter FinishID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.FinishID, Parameters.FinishID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter JobOrderStatusID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.JobOrderStatusID, Parameters.JobOrderStatusID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CreatedBy
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CreatedBy, Parameters.CreatedBy);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CreatedDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CreatedDate, Parameters.CreatedDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter UpdatedBy
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UpdatedBy, Parameters.UpdatedBy);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter LastUpdatedDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.LastUpdatedDate, Parameters.LastUpdatedDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter OffsetPrintingDetailsID
		    {
				get
		        {
					if(_OffsetPrintingDetailsID_W == null)
	        	    {
						_OffsetPrintingDetailsID_W = TearOff.OffsetPrintingDetailsID;
					}
					return _OffsetPrintingDetailsID_W;
				}
			}

			public AggregateParameter JobOrderID
		    {
				get
		        {
					if(_JobOrderID_W == null)
	        	    {
						_JobOrderID_W = TearOff.JobOrderID;
					}
					return _JobOrderID_W;
				}
			}

			public AggregateParameter PaperKindID
		    {
				get
		        {
					if(_PaperKindID_W == null)
	        	    {
						_PaperKindID_W = TearOff.PaperKindID;
					}
					return _PaperKindID_W;
				}
			}

			public AggregateParameter GSMID
		    {
				get
		        {
					if(_GSMID_W == null)
	        	    {
						_GSMID_W = TearOff.GSMID;
					}
					return _GSMID_W;
				}
			}

			public AggregateParameter PrintingHouseID
		    {
				get
		        {
					if(_PrintingHouseID_W == null)
	        	    {
						_PrintingHouseID_W = TearOff.PrintingHouseID;
					}
					return _PrintingHouseID_W;
				}
			}

			public AggregateParameter FinishID
		    {
				get
		        {
					if(_FinishID_W == null)
	        	    {
						_FinishID_W = TearOff.FinishID;
					}
					return _FinishID_W;
				}
			}

			public AggregateParameter JobOrderStatusID
		    {
				get
		        {
					if(_JobOrderStatusID_W == null)
	        	    {
						_JobOrderStatusID_W = TearOff.JobOrderStatusID;
					}
					return _JobOrderStatusID_W;
				}
			}

			public AggregateParameter CreatedBy
		    {
				get
		        {
					if(_CreatedBy_W == null)
	        	    {
						_CreatedBy_W = TearOff.CreatedBy;
					}
					return _CreatedBy_W;
				}
			}

			public AggregateParameter CreatedDate
		    {
				get
		        {
					if(_CreatedDate_W == null)
	        	    {
						_CreatedDate_W = TearOff.CreatedDate;
					}
					return _CreatedDate_W;
				}
			}

			public AggregateParameter UpdatedBy
		    {
				get
		        {
					if(_UpdatedBy_W == null)
	        	    {
						_UpdatedBy_W = TearOff.UpdatedBy;
					}
					return _UpdatedBy_W;
				}
			}

			public AggregateParameter LastUpdatedDate
		    {
				get
		        {
					if(_LastUpdatedDate_W == null)
	        	    {
						_LastUpdatedDate_W = TearOff.LastUpdatedDate;
					}
					return _LastUpdatedDate_W;
				}
			}

			private AggregateParameter _OffsetPrintingDetailsID_W = null;
			private AggregateParameter _JobOrderID_W = null;
			private AggregateParameter _PaperKindID_W = null;
			private AggregateParameter _GSMID_W = null;
			private AggregateParameter _PrintingHouseID_W = null;
			private AggregateParameter _FinishID_W = null;
			private AggregateParameter _JobOrderStatusID_W = null;
			private AggregateParameter _CreatedBy_W = null;
			private AggregateParameter _CreatedDate_W = null;
			private AggregateParameter _UpdatedBy_W = null;
			private AggregateParameter _LastUpdatedDate_W = null;

			public void AggregateClauseReset()
			{
				_OffsetPrintingDetailsID_W = null;
				_JobOrderID_W = null;
				_PaperKindID_W = null;
				_GSMID_W = null;
				_PrintingHouseID_W = null;
				_FinishID_W = null;
				_JobOrderStatusID_W = null;
				_CreatedBy_W = null;
				_CreatedDate_W = null;
				_UpdatedBy_W = null;
				_LastUpdatedDate_W = null;

				this._entity.Query.FlushAggregateParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffAggregateParameter _tearOff;
			
		}
	
		public AggregateClause Aggregate
		{
			get
			{
				if(_aggregateClause == null)
				{
					_aggregateClause = new AggregateClause(this);
				}
		
				return _aggregateClause;
			}
		}
		
		private AggregateClause _aggregateClause = null;	
		#endregion
	
		protected override IDbCommand GetInsertCommand() 
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_OffsetPrintingDetailsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.OffsetPrintingDetailsID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_OffsetPrintingDetailsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_OffsetPrintingDetailsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.OffsetPrintingDetailsID);
			p.SourceColumn = ColumnNames.OffsetPrintingDetailsID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.OffsetPrintingDetailsID);
			p.SourceColumn = ColumnNames.OffsetPrintingDetailsID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.JobOrderID);
			p.SourceColumn = ColumnNames.JobOrderID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.PaperKindID);
			p.SourceColumn = ColumnNames.PaperKindID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.GSMID);
			p.SourceColumn = ColumnNames.GSMID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.PrintingHouseID);
			p.SourceColumn = ColumnNames.PrintingHouseID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.FinishID);
			p.SourceColumn = ColumnNames.FinishID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.JobOrderStatusID);
			p.SourceColumn = ColumnNames.JobOrderStatusID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CreatedBy);
			p.SourceColumn = ColumnNames.CreatedBy;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CreatedDate);
			p.SourceColumn = ColumnNames.CreatedDate;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.UpdatedBy);
			p.SourceColumn = ColumnNames.UpdatedBy;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.LastUpdatedDate);
			p.SourceColumn = ColumnNames.LastUpdatedDate;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
