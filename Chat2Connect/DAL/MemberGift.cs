
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
	public abstract class _MemberGift : SqlClientEntity
	{
		public _MemberGift()
		{
			this.QuerySource = "MemberGift";
			this.MappingName = "MemberGift";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_MemberGiftLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int MemberGiftID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.MemberGiftID, MemberGiftID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_MemberGiftLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter MemberGiftID
			{
				get
				{
					return new SqlParameter("@MemberGiftID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter MemberID
			{
				get
				{
					return new SqlParameter("@MemberID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter GiftID
			{
				get
				{
					return new SqlParameter("@GiftID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter SenderID
			{
				get
				{
					return new SqlParameter("@SenderID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter SendDate
			{
				get
				{
					return new SqlParameter("@SendDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string MemberGiftID = "MemberGiftID";
            public const string MemberID = "MemberID";
            public const string GiftID = "GiftID";
            public const string SenderID = "SenderID";
            public const string SendDate = "SendDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[MemberGiftID] = _MemberGift.PropertyNames.MemberGiftID;
					ht[MemberID] = _MemberGift.PropertyNames.MemberID;
					ht[GiftID] = _MemberGift.PropertyNames.GiftID;
					ht[SenderID] = _MemberGift.PropertyNames.SenderID;
					ht[SendDate] = _MemberGift.PropertyNames.SendDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string MemberGiftID = "MemberGiftID";
            public const string MemberID = "MemberID";
            public const string GiftID = "GiftID";
            public const string SenderID = "SenderID";
            public const string SendDate = "SendDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[MemberGiftID] = _MemberGift.ColumnNames.MemberGiftID;
					ht[MemberID] = _MemberGift.ColumnNames.MemberID;
					ht[GiftID] = _MemberGift.ColumnNames.GiftID;
					ht[SenderID] = _MemberGift.ColumnNames.SenderID;
					ht[SendDate] = _MemberGift.ColumnNames.SendDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string MemberGiftID = "s_MemberGiftID";
            public const string MemberID = "s_MemberID";
            public const string GiftID = "s_GiftID";
            public const string SenderID = "s_SenderID";
            public const string SendDate = "s_SendDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int MemberGiftID
	    {
			get
	        {
				return base.Getint(ColumnNames.MemberGiftID);
			}
			set
	        {
				base.Setint(ColumnNames.MemberGiftID, value);
			}
		}

		public virtual int MemberID
	    {
			get
	        {
				return base.Getint(ColumnNames.MemberID);
			}
			set
	        {
				base.Setint(ColumnNames.MemberID, value);
			}
		}

		public virtual int GiftID
	    {
			get
	        {
				return base.Getint(ColumnNames.GiftID);
			}
			set
	        {
				base.Setint(ColumnNames.GiftID, value);
			}
		}

		public virtual int SenderID
	    {
			get
	        {
				return base.Getint(ColumnNames.SenderID);
			}
			set
	        {
				base.Setint(ColumnNames.SenderID, value);
			}
		}

		public virtual DateTime SendDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.SendDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.SendDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_MemberGiftID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.MemberGiftID) ? string.Empty : base.GetintAsString(ColumnNames.MemberGiftID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.MemberGiftID);
				else
					this.MemberGiftID = base.SetintAsString(ColumnNames.MemberGiftID, value);
			}
		}

		public virtual string s_MemberID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.MemberID) ? string.Empty : base.GetintAsString(ColumnNames.MemberID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.MemberID);
				else
					this.MemberID = base.SetintAsString(ColumnNames.MemberID, value);
			}
		}

		public virtual string s_GiftID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GiftID) ? string.Empty : base.GetintAsString(ColumnNames.GiftID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GiftID);
				else
					this.GiftID = base.SetintAsString(ColumnNames.GiftID, value);
			}
		}

		public virtual string s_SenderID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.SenderID) ? string.Empty : base.GetintAsString(ColumnNames.SenderID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.SenderID);
				else
					this.SenderID = base.SetintAsString(ColumnNames.SenderID, value);
			}
		}

		public virtual string s_SendDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.SendDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.SendDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.SendDate);
				else
					this.SendDate = base.SetDateTimeAsString(ColumnNames.SendDate, value);
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
				
				
				public WhereParameter MemberGiftID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.MemberGiftID, Parameters.MemberGiftID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter MemberID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.MemberID, Parameters.MemberID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter GiftID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GiftID, Parameters.GiftID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter SenderID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.SenderID, Parameters.SenderID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter SendDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.SendDate, Parameters.SendDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter MemberGiftID
		    {
				get
		        {
					if(_MemberGiftID_W == null)
	        	    {
						_MemberGiftID_W = TearOff.MemberGiftID;
					}
					return _MemberGiftID_W;
				}
			}

			public WhereParameter MemberID
		    {
				get
		        {
					if(_MemberID_W == null)
	        	    {
						_MemberID_W = TearOff.MemberID;
					}
					return _MemberID_W;
				}
			}

			public WhereParameter GiftID
		    {
				get
		        {
					if(_GiftID_W == null)
	        	    {
						_GiftID_W = TearOff.GiftID;
					}
					return _GiftID_W;
				}
			}

			public WhereParameter SenderID
		    {
				get
		        {
					if(_SenderID_W == null)
	        	    {
						_SenderID_W = TearOff.SenderID;
					}
					return _SenderID_W;
				}
			}

			public WhereParameter SendDate
		    {
				get
		        {
					if(_SendDate_W == null)
	        	    {
						_SendDate_W = TearOff.SendDate;
					}
					return _SendDate_W;
				}
			}

			private WhereParameter _MemberGiftID_W = null;
			private WhereParameter _MemberID_W = null;
			private WhereParameter _GiftID_W = null;
			private WhereParameter _SenderID_W = null;
			private WhereParameter _SendDate_W = null;

			public void WhereClauseReset()
			{
				_MemberGiftID_W = null;
				_MemberID_W = null;
				_GiftID_W = null;
				_SenderID_W = null;
				_SendDate_W = null;

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
				
				
				public AggregateParameter MemberGiftID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.MemberGiftID, Parameters.MemberGiftID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter MemberID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.MemberID, Parameters.MemberID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter GiftID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GiftID, Parameters.GiftID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter SenderID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.SenderID, Parameters.SenderID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter SendDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.SendDate, Parameters.SendDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter MemberGiftID
		    {
				get
		        {
					if(_MemberGiftID_W == null)
	        	    {
						_MemberGiftID_W = TearOff.MemberGiftID;
					}
					return _MemberGiftID_W;
				}
			}

			public AggregateParameter MemberID
		    {
				get
		        {
					if(_MemberID_W == null)
	        	    {
						_MemberID_W = TearOff.MemberID;
					}
					return _MemberID_W;
				}
			}

			public AggregateParameter GiftID
		    {
				get
		        {
					if(_GiftID_W == null)
	        	    {
						_GiftID_W = TearOff.GiftID;
					}
					return _GiftID_W;
				}
			}

			public AggregateParameter SenderID
		    {
				get
		        {
					if(_SenderID_W == null)
	        	    {
						_SenderID_W = TearOff.SenderID;
					}
					return _SenderID_W;
				}
			}

			public AggregateParameter SendDate
		    {
				get
		        {
					if(_SendDate_W == null)
	        	    {
						_SendDate_W = TearOff.SendDate;
					}
					return _SendDate_W;
				}
			}

			private AggregateParameter _MemberGiftID_W = null;
			private AggregateParameter _MemberID_W = null;
			private AggregateParameter _GiftID_W = null;
			private AggregateParameter _SenderID_W = null;
			private AggregateParameter _SendDate_W = null;

			public void AggregateClauseReset()
			{
				_MemberGiftID_W = null;
				_MemberID_W = null;
				_GiftID_W = null;
				_SenderID_W = null;
				_SendDate_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MemberGiftInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.MemberGiftID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MemberGiftUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MemberGiftDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.MemberGiftID);
			p.SourceColumn = ColumnNames.MemberGiftID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.MemberGiftID);
			p.SourceColumn = ColumnNames.MemberGiftID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.MemberID);
			p.SourceColumn = ColumnNames.MemberID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.GiftID);
			p.SourceColumn = ColumnNames.GiftID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.SenderID);
			p.SourceColumn = ColumnNames.SenderID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.SendDate);
			p.SourceColumn = ColumnNames.SendDate;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
