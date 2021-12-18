namespace DataLayer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Add_Tags_Pages : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Pages", "tag", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Pages", "tag");
        }
    }
}
