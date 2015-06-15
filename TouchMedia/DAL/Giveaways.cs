
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

namespace Your.Namespace
{
	public abstract class _Giveaways : SqlClientEntity
	{
		public _Giveaways()
		{
			this.QuerySource = "Giveaways";
			this.MappingName = "Giveaways";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_GiveawaysLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int GiveawayID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.GiveawayID, GiveawayID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_GiveawaysLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter GiveawayID
			{
				get
				{
					return new SqlParameter("@GiveawayID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter JobOrderID
			{
				get
				{
					return new SqlParameter("@JobOrderID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ItemName
			{
				get
				{
					return new SqlParameter("@ItemName", SqlDbType.NVarChar, 300);
				}
			}
			
			public static SqlParameter GiveawayDescription
			{
				get
				{
					return new SqlParameter("@GiveawayDescription", SqlDbType.NVarChar, 300);
				}
			}
			
			public static SqlParameter GiveawayQuantity
			{
				get
				{
					return new SqlParameter("@GiveawayQuantity", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter PricePerItem
			{
				get
				{
					return new SqlParameter("@PricePerItem", SqlDbType.Float, 0);
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
            public const string GiveawayID = "GiveawayID";
            public const string JobOrderID = "JobOrderID";
            public const string ItemName = "ItemName";
            public const string GiveawayDescription = "GiveawayDescription";
            public const string GiveawayQuantity = "GiveawayQuantity";
            public const string PricePerItem = "PricePerItem";
            public const string CreatedBy = "CreatedBy";
            public const string CreatedDate = "CreatedDate";
            public const string UpdatedBy = "UpdatedBy";
            public const string LastUpdatedDate = "LastUpdatedDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[GiveawayID] = _Giveaways.PropertyNames.GiveawayID;
					ht[JobOrderID] = _Giveaways.PropertyNames.JobOrderID;
					ht[ItemName] = _Giveaways.PropertyNames.ItemName;
					ht[GiveawayDescription] = _Giveaways.PropertyNames.GiveawayDescription;
					ht[GiveawayQuantity] = _Giveaways.PropertyNames.GiveawayQuantity;
					ht[PricePerItem] = _Giveaways.PropertyNames.PricePerItem;
					ht[CreatedBy] = _Giveaways.PropertyNames.CreatedBy;
					ht[CreatedDate] = _Giveaways.PropertyNames.CreatedDate;
					ht[UpdatedBy] = _Giveaways.PropertyNames.UpdatedBy;
					ht[LastUpdatedDate] = _Giveaways.PropertyNames.LastUpdatedDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string GiveawayID = "GiveawayID";
            public const string JobOrderID = "JobOrderID";
            public const string ItemName = "ItemName";
            public const string GiveawayDescription = "GiveawayDescription";
            public const string GiveawayQuantity = "GiveawayQuantity";
            public const string PricePerItem = "PricePerItem";
            public const string CreatedBy = "CreatedBy";
            public const string CreatedDate = "CreatedDate";
            public const string UpdatedBy = "UpdatedBy";
            public const string LastUpdatedDate = "LastUpdatedDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[GiveawayID] = _Giveaways.ColumnNames.GiveawayID;
					ht[JobOrderID] = _Giveaways.ColumnNames.JobOrderID;
					ht[ItemName] = _Giveaways.ColumnNames.ItemName;
					ht[GiveawayDescription] = _Giveaways.ColumnNames.GiveawayDescription;
					ht[GiveawayQuantity] = _Giveaways.ColumnNames.GiveawayQuantity;
					ht[PricePerItem] = _Giveaways.ColumnNames.PricePerItem;
					ht[CreatedBy] = _Giveaways.ColumnNames.CreatedBy;
					ht[CreatedDate] = _Giveaways.ColumnNames.CreatedDate;
					ht[UpdatedBy] = _Giveaways.ColumnNames.UpdatedBy;
					ht[LastUpdatedDate] = _Giveaways.ColumnNames.LastUpdatedDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string GiveawayID = "s_GiveawayID";
            public const string JobOrderID = "s_JobOrderID";
            public const string ItemName = "s_ItemName";
            public const string GiveawayDescription = "s_GiveawayDescription";
            public const string GiveawayQuantity = "s_GiveawayQuantity";
            public const string PricePerItem = "s_PricePerItem";
            public const string CreatedBy = "s_CreatedBy";
            public const string CreatedDate = "s_CreatedDate";
            public const string UpdatedBy = "s_UpdatedBy";
            public const string LastUpdatedDate = "s_LastUpdatedDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int GiveawayID
	    {
			get
	        {
				return base.Getint(ColumnNames.GiveawayID);
			}
			set
	        {
				base.Setint(ColumnNames.GiveawayID, value);
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

		public virtual string ItemName
	    {
			get
	        {
				return base.Getstring(ColumnNames.ItemName);
			}
			set
	        {
				base.Setstring(ColumnNames.ItemName, value);
			}
		}

		public virtual string GiveawayDescription
	    {
			get
	        {
				return base.Getstring(ColumnNames.GiveawayDescription);
			}
			set
	        {
				base.Setstring(ColumnNames.GiveawayDescription, value);
			}
		}

		public virtual int GiveawayQuantity
	    {
			get
	        {
				return base.Getint(ColumnNames.GiveawayQuantity);
			}
			set
	        {
				base.Setint(ColumnNames.GiveawayQuantity, value);
			}
		}

		public virtual double PricePerItem
	    {
			get
	        {
				return base.Getdouble(ColumnNames.PricePerItem);
			}
			set
	        {
				base.Setdouble(ColumnNames.PricePerItem, value);
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
	
		public virtual string s_GiveawayID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GiveawayID) ? string.Empty : base.GetintAsString(ColumnNames.GiveawayID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GiveawayID);
				else
					this.GiveawayID = base.SetintAsString(ColumnNames.GiveawayID, value);
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

		public virtual string s_ItemName
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ItemName) ? string.Empty : base.GetstringAsString(ColumnNames.ItemName);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ItemName);
				else
					this.ItemName = base.SetstringAsString(ColumnNames.ItemName, value);
			}
		}

		public virtual string s_GiveawayDescription
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GiveawayDescription) ? string.Empty : base.GetstringAsString(ColumnNames.GiveawayDescription);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GiveawayDescription);
				else
					this.GiveawayDescription = base.SetstringAsString(ColumnNames.GiveawayDescription, value);
			}
		}

		public virtual string s_GiveawayQuantity
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GiveawayQuantity) ? string.Empty : base.GetintAsString(ColumnNames.GiveawayQuantity);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GiveawayQuantity);
				else
					this.GiveawayQuantity = base.SetintAsString(ColumnNames.GiveawayQuantity, value);
			}
		}

		public virtual string s_PricePerItem
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PricePerItem) ? string.Empty : base.GetdoubleAsString(ColumnNames.PricePerItem);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PricePerItem);
				else
					this.PricePerItem = base.SetdoubleAsString(ColumnNames.PricePerItem, value);
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
				
				
				public WhereParameter GiveawayID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GiveawayID, Parameters.GiveawayID);
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

				public WhereParameter ItemName
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ItemName, Parameters.ItemName);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter GiveawayDescription
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GiveawayDescription, Parameters.GiveawayDescription);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter GiveawayQuantity
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GiveawayQuantity, Parameters.GiveawayQuantity);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter PricePerItem
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PricePerItem, Parameters.PricePerItem);
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
		
			public WhereParameter GiveawayID
		    {
				get
		        {
					if(_GiveawayID_W == null)
	        	    {
						_GiveawayID_W = TearOff.GiveawayID;
					}
					return _GiveawayID_W;
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

			public WhereParameter ItemName
		    {
				get
		        {
					if(_ItemName_W == null)
	        	    {
						_ItemName_W = TearOff.ItemName;
					}
					return _ItemName_W;
				}
			}

			public WhereParameter GiveawayDescription
		    {
				get
		        {
					if(_GiveawayDescription_W == null)
	        	    {
						_GiveawayDescription_W = TearOff.GiveawayDescription;
					}
					return _GiveawayDescription_W;
				}
			}

			public WhereParameter GiveawayQuantity
		    {
				get
		        {
					if(_GiveawayQuantity_W == null)
	        	    {
						_GiveawayQuantity_W = TearOff.GiveawayQuantity;
					}
					return _GiveawayQuantity_W;
				}
			}

			public WhereParameter PricePerItem
		    {
				get
		        {
					if(_PricePerItem_W == null)
	        	    {
						_PricePerItem_W = TearOff.PricePerItem;
					}
					return _PricePerItem_W;
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

			private WhereParameter _GiveawayID_W = null;
			private WhereParameter _JobOrderID_W = null;
			private WhereParameter _ItemName_W = null;
			private WhereParameter _GiveawayDescription_W = null;
			private WhereParameter _GiveawayQuantity_W = null;
			private WhereParameter _PricePerItem_W = null;
			private WhereParameter _CreatedBy_W = null;
			private WhereParameter _CreatedDate_W = null;
			private WhereParameter _UpdatedBy_W = null;
			private WhereParameter _LastUpdatedDate_W = null;

			public void WhereClauseReset()
			{
				_GiveawayID_W = null;
				_JobOrderID_W = null;
				_ItemName_W = null;
				_GiveawayDescription_W = null;
				_GiveawayQuantity_W = null;
				_PricePerItem_W = null;
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
				
				
				public AggregateParameter GiveawayID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GiveawayID, Parameters.GiveawayID);
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

				public AggregateParameter ItemName
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ItemName, Parameters.ItemName);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter GiveawayDescription
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GiveawayDescription, Parameters.GiveawayDescription);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter GiveawayQuantity
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GiveawayQuantity, Parameters.GiveawayQuantity);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter PricePerItem
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PricePerItem, Parameters.PricePerItem);
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
		
			public AggregateParameter GiveawayID
		    {
				get
		        {
					if(_GiveawayID_W == null)
	        	    {
						_GiveawayID_W = TearOff.GiveawayID;
					}
					return _GiveawayID_W;
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

			public AggregateParameter ItemName
		    {
				get
		        {
					if(_ItemName_W == null)
	        	    {
						_ItemName_W = TearOff.ItemName;
					}
					return _ItemName_W;
				}
			}

			public AggregateParameter GiveawayDescription
		    {
				get
		        {
					if(_GiveawayDescription_W == null)
	        	    {
						_GiveawayDescription_W = TearOff.GiveawayDescription;
					}
					return _GiveawayDescription_W;
				}
			}

			public AggregateParameter GiveawayQuantity
		    {
				get
		        {
					if(_GiveawayQuantity_W == null)
	        	    {
						_GiveawayQuantity_W = TearOff.GiveawayQuantity;
					}
					return _GiveawayQuantity_W;
				}
			}

			public AggregateParameter PricePerItem
		    {
				get
		        {
					if(_PricePerItem_W == null)
	        	    {
						_PricePerItem_W = TearOff.PricePerItem;
					}
					return _PricePerItem_W;
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

			private AggregateParameter _GiveawayID_W = null;
			private AggregateParameter _JobOrderID_W = null;
			private AggregateParameter _ItemName_W = null;
			private AggregateParameter _GiveawayDescription_W = null;
			private AggregateParameter _GiveawayQuantity_W = null;
			private AggregateParameter _PricePerItem_W = null;
			private AggregateParameter _CreatedBy_W = null;
			private AggregateParameter _CreatedDate_W = null;
			private AggregateParameter _UpdatedBy_W = null;
			private AggregateParameter _LastUpdatedDate_W = null;

			public void AggregateClauseReset()
			{
				_GiveawayID_W = null;
				_JobOrderID_W = null;
				_ItemName_W = null;
				_GiveawayDescription_W = null;
				_GiveawayQuantity_W = null;
				_PricePerItem_W = null;
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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GiveawaysInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.GiveawayID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GiveawaysUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GiveawaysDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.GiveawayID);
			p.SourceColumn = ColumnNames.GiveawayID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.GiveawayID);
			p.SourceColumn = ColumnNames.GiveawayID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.JobOrderID);
			p.SourceColumn = ColumnNames.JobOrderID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ItemName);
			p.SourceColumn = ColumnNames.ItemName;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.GiveawayDescription);
			p.SourceColumn = ColumnNames.GiveawayDescription;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.GiveawayQuantity);
			p.SourceColumn = ColumnNames.GiveawayQuantity;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.PricePerItem);
			p.SourceColumn = ColumnNames.PricePerItem;
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
