﻿using System.Linq;
using Yuyi.Oa.Model;
using Yuyi.Oa.Model.Param;

namespace Yuyi.Oa.IBLL
{
    public interface IBikeInfoService:IBaseService<BikeInfo>
    {
        #region 单车多条件查询
        /// <summary>
        /// 多条件查询业务逻辑封装
        /// </summary>
        /// <param name="userQueryParam">传入参数条件</param>
        /// <returns></returns>
        IQueryable<BikeInfo> LoadPageData(UserQueryParam userQueryParam);
        #endregion
    }
}