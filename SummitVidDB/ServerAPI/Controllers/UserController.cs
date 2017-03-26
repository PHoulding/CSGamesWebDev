using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http;

// For more information on enabling Web API for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace ServerAPI
{
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        // GET: api/user
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/user/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/user
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/user/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/user/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
