Shader "Custom/GroundShader" {
    Properties {
        _TopColor ("Top Color", Color) = (1, 1, 1, 1)
        _BottomColor ("Bottom Color", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Smoothness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }

    SubShader {
        Tags {"Queue"="Transparent" "RenderType"="Transparent"}
        LOD 100

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;
        float4 _TopColor;
        float4 _BottomColor;
        float _Glossiness;
        float _Smoothness;
        float _Metallic;

        struct Input {
            float2 uv_MainTex;
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutputStandard o) {
            float gradientValue = IN.uv_MainTex.x;
            o.Albedo = lerp(_BottomColor.rgb, _TopColor.rgb, gradientValue);
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;
            o.Alpha = 1.0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}


        //_MainTex ("Albedo (RGB)", 2D) = "white" {}